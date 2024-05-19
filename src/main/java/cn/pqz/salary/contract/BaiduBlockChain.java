package cn.pqz.salary.contract;

import com.baidu.xuper.api.Account;
import com.baidu.xuper.api.Transaction;
import com.baidu.xuper.api.XuperClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Random;

/**
 * @author urey.liu
 * @date 2024/5/9 11:35 AM
 */
@Slf4j
public abstract class BaiduBlockChain implements InitializingBean {

    @Resource
    private EmployeeService employeeService;

    public XuperClient client;

    public static String CONTRACT_NAME;

    public static Account ADMIN_ACCOUNT;

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    public Transaction invokeContract(Account account, String method, Map<String, String> params) {
        return client.invokeEVMContract(account, CONTRACT_NAME, method, params, null);
    }

    public String createContractAddress() {
        String name = getGUID();
        return createContractAddressByName(name);
    }

    public String createContractAddressByName(String name) {
        Transaction contractAccount = client.createContractAccount(ADMIN_ACCOUNT, name);
        log.info("account is {}",contractAccount.getContractResponse().getBodyStr());
        return name;
    }

    public void transferToContract(String address) {
        client.transfer(ADMIN_ACCOUNT, address, BigInteger.valueOf(100000), "100");
    }

    public static String getGUID() {
        StringBuilder uid = new StringBuilder();
        Random rd = new SecureRandom();
        for (int i = 0; i < 16; i++) {
            uid.append(rd.nextInt(10));
        }
        return uid.toString();
    }
}
