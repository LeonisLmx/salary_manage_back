package cn.pqz.emsboot.contract;

import cn.pqz.emsboot.modules.sys.entity.UserContract;
import cn.pqz.emsboot.modules.sys.entity.UserSalaryDetail;
import cn.pqz.emsboot.modules.sys.mapper.UserContractMapper;
import cn.pqz.emsboot.modules.sys.mapper.UserSalaryDetailMapper;
import com.alibaba.fastjson.JSON;
import com.baidu.xuper.api.Account;
import com.baidu.xuper.api.Transaction;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static cn.pqz.emsboot.contract.ContractMethodConstant.*;
import static cn.pqz.emsboot.contract.LocalBaiduBlockChain.ADMIN_ACCOUNT;

/**
 * @author urey.liu
 * @date 2024/5/7 1:09 PM
 */
@Slf4j
@Service
public class EmployeeService {

    @Autowired
    private BaiduBlockChain baiduBlockChain;

    @Resource
    private UserContractMapper userContractMapper;

    @Resource
    private UserSalaryDetailMapper userSalaryDetailMapper;

    public Account getAccount(Long userId) {
        UserContract userContract = userContractMapper.selectOne(new LambdaQueryWrapper<UserContract>().eq(UserContract::getUserId, userId));
        Account account = Account.retrieve(userContract.getMnemonic(), 2);
        account.setContractAccount(userContract.getContractName());
        return account;
    }


    public void addEmployee(Account account, Long salary, Long payDuration) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", getAddress(account));
        map.put("salary", String.valueOf(salary));
        map.put("payDuration", String.valueOf(TimeUnit.MINUTES.toMillis(payDuration)));
//        map.put("timestamp", String.valueOf(new DateTime().withMillisOfDay(0).getMillis()));
        map.put("timestamp", String.valueOf(new DateTime().withMillisOfSecond(0).withSecondOfMinute(0).getMillis()));
        map.put("holiday", "0");
        invokeByAdmin(ADD_EMPLOYEE, map);
        log.info("add employee success by address {}", account.getAddress());
    }

    public void delEmployee(Long userId) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", address(userId));
        invokeByAdmin(REMOVE_EMPLOYEE, map);
        log.info("remove employee for userId {} success", userId);
    }

    public void updateEmployee(Long userId, Long salary, Long payDuration, Long holiday) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", address(userId));
        map.put("salary", String.valueOf(salary));
        map.put("payDuration", String.valueOf(TimeUnit.MINUTES.toMillis(payDuration)));
        map.put("holiday", holiday.toString());
        invokeByAdmin(UPDATE_EMPLOYEE, map);
        log.info("update player for userId {} success", userId);
    }

    public String payForSalary(Long userId) {
        Map<String, String> map = new HashMap<>();
//        map.put("timestamp", String.valueOf(new DateTime().withMillisOfDay(0).getMillis()));
        map.put("timestamp", String.valueOf(new DateTime().withMillisOfSecond(0).withSecondOfMinute(0).getMillis()));
        map.put("timeUnit", String.valueOf(TimeUnit.MINUTES.toMillis(1)));
        return this.payForSalary(userId, map);
    }

    public String payForSalary(Long userId, Map<String, String> map) {
        Transaction transaction = invokeTransaction(userId, PAY_FOR_SALARY, map);
        String txid = transaction.getTxid();
        String transactionResponse = getTransactionResponse(transaction);
        log.info("transaction is {}", transactionResponse);
        if (StringUtils.isBlank(txid)){
            return "FAILED";
        }
        UserSalaryDetail userSalaryDetail = new UserSalaryDetail();
        userSalaryDetail.setHashId(txid);
        userSalaryDetail.setUserId(userId);
        userSalaryDetail.setSalary(new BigDecimal(transactionResponse));
        userSalaryDetailMapper.insert(userSalaryDetail);
        return "SUCCESS";
    }

    public String getEmployeeSalary(Long userId) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", address(userId));
        Transaction transaction = baiduBlockChain.invokeContract(ADMIN_ACCOUNT, "getEmployeeSalary", map);
        return getTransactionResponse(transaction);
    }

    public String getSalary(Long userId) {
        Transaction transaction = invokeTransaction(userId, GET_EMPLOYEE_SALARY, new HashMap<>());
        return getTransactionResponse(transaction);
    }

    public String getBalance(Long userId) {
        Transaction transaction = invokeTransaction(userId, GET_EMPLOYEE_BALANCE, new HashMap<>());
        return getTransactionResponse(transaction);
    }

    public String getAddress(Account account) {
        Transaction transaction = invokeTransaction(account, GET_CONTRACT_ADDRESS, new HashMap<>());
        return getTransactionResponse(transaction);
    }

    public void addTotalBalance(Long amount) {
        Map<String, String> map = new HashMap<>();
        map.put("amount", amount.toString());
        invokeByAdmin(ADD_FUND, map);
        log.info("add total balance for contract amount {}", amount);
    }

    public String getTotalBalance() {
        return getTransactionResponse(invokeByAdmin(GET_TOTAL_BALANCE, new HashMap<>()));
    }

    public String getNextPayTime(Long userId) {
        Transaction transaction = invokeTransaction(userId, GET_NEXT_PAY_TIME, new HashMap<>());
        return getTransactionResponse(transaction);
    }

    public String address(Long userId) {
        UserContract userContract = userContractMapper.selectOne(new LambdaQueryWrapper<UserContract>().eq(UserContract::getUserId, userId));
        return userContract.getContractAddress();
    }

    private Transaction invokeTransaction(Long userId, String method, Map<String, String> map){
        Account account = getAccount(userId);
        return invokeTransaction(account, method, map);
    }

    private Transaction invokeTransaction(Account account, String method, Map<String, String> map){
        return baiduBlockChain.invokeContract(account, method, map);
    }

    public void transfer(String address) {
        baiduBlockChain.transferToContract(address);
    }

    public String invoke(Long userId, String method, Map<String, String> map){
        try {
            Transaction transaction;
            if (userId == -1){
                transaction = invokeTransaction(ADMIN_ACCOUNT, method, map);
            }else {
                transaction = invokeTransaction(userId, method, map);
            }
            log.info("invoke contract success by method {}", method);
            return transaction.getContractResponse().getBodyStr();
        }catch (RuntimeException e){
            String msg = e.getMessage();
            if (msg.contains("reason")){
                return msg.substring(msg.indexOf("reason") + 8, msg.length() - 1);
            }
            return "Failed";
        }
    }

    private Transaction invokeByAdmin(String method, Map<String, String> map){
        return baiduBlockChain.invokeContract(ADMIN_ACCOUNT, method, map);
    }

    private String getTransactionResponse(Transaction transaction) {
        Map map = JSON.parseArray(transaction.getContractResponse().getBodyStr(), Map.class).get(0);
        return map.get("0").toString();
    }
}
