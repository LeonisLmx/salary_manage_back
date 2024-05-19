package cn.pqz.salary.modules;

import cn.pqz.salary.contract.BaiduBlockChain;
import cn.pqz.salary.contract.EmployeeService;
import cn.pqz.salary.entity.User;
import cn.pqz.salary.entity.UserContract;
import cn.pqz.salary.mapper.UserContractMapper;
import cn.pqz.salary.service.UserService;
import com.baidu.xuper.api.Account;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import static cn.pqz.salary.contract.ContractMethodConstant.PAY_FOR_SALARY;

/**
 * @author urey.liu
 * @date 2024/5/6 1:39 PM
 */
@RequestMapping("/test")
@RestController
public class TestController {

    @Autowired
    private BaiduBlockChain baiduBlockChain;

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserService userService;

    @Resource
    private UserContractMapper userContractMapper;

    @RequestMapping("/getPaid")
    public String getPaid(Long userId) {
        return employeeService.payForSalary(userId);
    }

    @RequestMapping("/getBalance")
    public String getBalance(Long userId) {
        return employeeService.getBalance(userId);
    }

    @RequestMapping("/getAddress")
    public String getAddress() {
        Account account = Account.retrieve("disease zebra poet chimney wedding employ electric attack food drive clown cannon", 2);
        return employeeService.getAddress(account);
    }

    @RequestMapping("/createContract")
    public String createContract() {
        baiduBlockChain.createContractAddress();
        return "SUCCESS";
    }

    @RequestMapping("/dataToContract")
    public String dataToContract() {
        List<User> list = userService.list();
        for (User user : list) {
            UserContract userContract = userContractMapper.selectOne(new LambdaQueryWrapper<UserContract>().eq(UserContract::getUserId, user.getId().longValue()));
            if (userContract == null) {
                Account account = Account.create(1, 2);
                baiduBlockChain.transferToContract(account.getAddress());
                userService.addToContract(account, user);
            }else{
                Account account = Account.retrieve(userContract.getMnemonic(), 2);
                baiduBlockChain.transferToContract(account.getAddress());
                userService.updateContract(account, user, userContract);
            }
        }
        return "SUCCESS";
    }

    @RequestMapping("/test")
    public String test(){
        return "success";
    }
}
