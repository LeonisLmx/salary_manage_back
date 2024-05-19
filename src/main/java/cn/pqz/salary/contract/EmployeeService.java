package cn.pqz.salary.contract;

import cn.pqz.salary.entity.HolidayConfig;
import cn.pqz.salary.entity.User;
import cn.pqz.salary.entity.UserContract;
import cn.pqz.salary.entity.UserSalaryDetail;
import cn.pqz.salary.mapper.HolidayConfigMapper;
import cn.pqz.salary.mapper.UserContractMapper;
import cn.pqz.salary.mapper.UserSalaryDetailMapper;
import cn.pqz.salary.service.HolidayManageService;
import cn.pqz.salary.service.UserService;
import com.alibaba.fastjson.JSON;
import com.baidu.xuper.api.Account;
import com.baidu.xuper.api.Transaction;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

import static cn.pqz.salary.contract.ContractMethodConstant.*;
import static cn.pqz.salary.contract.LocalBaiduBlockChain.ADMIN_ACCOUNT;

/**
 * @author urey.liu
 * @date 2024/5/7 1:09 PM
 */
@Slf4j
@Service
public class EmployeeService implements InitializingBean {

    private static final List<Long> HOLIDAY_LIST = new ArrayList<>();

    private static final List<Long> WORK_LIST = new ArrayList<>();

    @Autowired
    private BaiduBlockChain baiduBlockChain;

    @Resource
    private UserContractMapper userContractMapper;

    @Resource
    private UserSalaryDetailMapper userSalaryDetailMapper;

    @Resource
    private HolidayConfigMapper holidayConfigMapper;

    @Resource
    private UserService userService;

    @Resource
    private HolidayManageService holidayManageService;

    @Override
    public void afterPropertiesSet() throws Exception {
        List<HolidayConfig> holidayConfigs = holidayConfigMapper.selectList(new LambdaQueryWrapper<>());
        for (HolidayConfig holidayConfig : holidayConfigs) {
            if (holidayConfig.getState() == 1){
                HOLIDAY_LIST.add(holidayConfig.getConfigTime().getTime());
            }else{
                WORK_LIST.add(holidayConfig.getConfigTime().getTime());
            }
        }
    }

    public Account getAccount(Long userId) {
        UserContract userContract = userContractMapper.selectOne(new LambdaQueryWrapper<UserContract>().eq(UserContract::getUserId, userId));
        Account account = Account.retrieve(userContract.getMnemonic(), 2);
        account.setContractAccount(userContract.getContractName());
        return account;
    }


    public void addEmployee(Account account) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", getAddress(account));
        map.put("payState", "1");
        invokeByAdmin(ADD_EMPLOYEE, map);
        log.info("add employee success by address {}", account.getAddress());
    }

    public void delEmployee(Long userId) {
        Map<String, String> map = new HashMap<>();
        map.put("employee", address(userId));
        invokeByAdmin(REMOVE_EMPLOYEE, map);
        log.info("remove employee for userId {} success", userId);
    }

    public void updateEmployee(Long userId) {
        Map<String, String> map = new HashMap<>();
        User user = userService.getById(userId);
        map.put("employee", address(userId));
        map.put("payState", String.valueOf(user.getSalaryEnabled()));
        invokeByAdmin(UPDATE_EMPLOYEE, map);
        log.info("update player payState for userId {} success", userId);
    }

    public String payForSalary(Long userId) {
        long currentTime = new DateTime().withSecondOfMinute(0).withMillisOfSecond(0).getMillis();
        User user = userService.getById(userId);
        DateTime dt = new DateTime(currentTime);
        int hour = dt.getHourOfDay();
        if (hour < 9){
            dt = dt.withHourOfDay(9).withMinuteOfHour(0);
        }
        if (hour > 17){
            dt = dt.withHourOfDay(17).withMinuteOfHour(0);
        }
        currentTime = dt.getMillis();
        long shouldDuration = holidayManageService.workMinutesBetweenTime(user.getLastPayTime(), dt.toDate());
        BigDecimal base = user.getSalary().divide(new BigDecimal(getWorkDaysInMonth()).multiply(new BigDecimal(480)), 4, RoundingMode.HALF_UP);
        BigDecimal shouldAmount = base.multiply(new BigDecimal(shouldDuration));
        log.info("pay salary for userId should duration {} salary base {} should amount {}", shouldDuration, base, shouldAmount);
        Map<String, String> map = new HashMap<>();
        map.put("amount", shouldAmount.toPlainString());
        Transaction transaction = invokeTransaction(userId, PAY_FOR_SALARY, map);
        String txId = transaction.getTxid();
        String transactionResponse = getTransactionResponse(transaction);
        log.info("transaction is {}", transactionResponse);
        if (StringUtils.isBlank(txId)){
            return "FAILED";
        }
        UserSalaryDetail userSalaryDetail = new UserSalaryDetail();
        userSalaryDetail.setHashId(txId);
        userSalaryDetail.setUserId(userId);
        userSalaryDetail.setShouldDuration(shouldDuration);
        long holidayMinutes = holidayManageService.calcUsersHolidayInTime(userId, currentTime);
        userSalaryDetail.setActualDuration(userSalaryDetail.getShouldDuration() - holidayMinutes);
        userSalaryDetail.setShouldSalary(shouldAmount);
        userSalaryDetail.setActualSalary(base.multiply(new BigDecimal(userSalaryDetail.getActualDuration())));
        userSalaryDetailMapper.insert(userSalaryDetail);
        user.setLastPayTime(new Date(currentTime));
        user.setNextPayTime(holidayManageService.nextPayTime(new DateTime(currentTime), user.getPayDuration(), user.getPayUnit()));
        userService.updateById(user);
        return "SUCCESS";
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

    private Transaction invokeByAdmin(String method, Map<String, String> map){
        return baiduBlockChain.invokeContract(ADMIN_ACCOUNT, method, map);
    }

    private String getTransactionResponse(Transaction transaction) {
        Map map = JSON.parseArray(transaction.getContractResponse().getBodyStr(), Map.class).get(0);
        return map.get("0").toString();
    }

    private Integer getWorkDaysInMonth() {
        int workDay = 0;
        DateTime dateTime = new DateTime().withDayOfMonth(1).withMillisOfDay(0);
        DateTime targetTime = dateTime.plusMonths(1);
        while (dateTime.isBefore(targetTime)){
            long time = dateTime.getMillis();
            int dayOfWeek = dateTime.dayOfWeek().get();
            dateTime = dateTime.plusDays(1);
            if (WORK_LIST.contains(time)){
                workDay++;
                continue;
            }
            if (HOLIDAY_LIST.contains(time)){
                continue;
            }
            if(dayOfWeek == 6 || dayOfWeek == 7){
                continue;
            }
            workDay++;
        }
        return workDay;
    }
}
