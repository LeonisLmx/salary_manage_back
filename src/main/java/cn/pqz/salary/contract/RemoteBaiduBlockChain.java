package cn.pqz.salary.contract;

import com.baidu.xuper.api.Account;
import com.baidu.xuper.api.XuperClient;
import com.baidu.xuper.config.Config;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.core.io.ClassPathResource;

/**
 * @author urey.liu
 * @date 2024/5/9 10:13 AM
 */
@Slf4j
@ConditionalOnMissingBean(value = BaiduBlockChain.class)
public class RemoteBaiduBlockChain extends BaiduBlockChain{

//    private static final String CONTRACT_ADDRESS = "XC8247644171097053@xuper";

    @Override
    public void afterPropertiesSet() throws Exception {
        CONTRACT_NAME = "salary_test_01";
        Config.setConfigPath(new ClassPathResource("sdk.yaml").getFile().getPath());
        client = new XuperClient("39.156.69.83:37100");
        String path = new ClassPathResource("private.key").getFile().getPath();
        ADMIN_ACCOUNT = Account.getAccountFromFile(path.substring(0, path.length() - "private.key".length()),"125800");
        ADMIN_ACCOUNT.setContractAccount("BC98419A89BC3071E7621AF9A0E4373359816500");
        log.info("admin account address  is {}", ADMIN_ACCOUNT.getAddress());
        log.info("admin account mnemonic is {} ", ADMIN_ACCOUNT.getMnemonic());
    }
}
