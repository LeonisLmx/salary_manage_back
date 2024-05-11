package cn.pqz.emsboot.modules;

import cn.pqz.emsboot.contract.BaiduBlockChain;
import cn.pqz.emsboot.contract.LocalBaiduBlockChain;
import cn.pqz.emsboot.contract.EmployeeService;
import cn.pqz.emsboot.contract.RemoteBaiduBlockChain;
import cn.pqz.emsboot.modules.sys.entity.User;
import cn.pqz.emsboot.modules.sys.entity.UserContract;
import cn.pqz.emsboot.modules.sys.mapper.UserContractMapper;
import cn.pqz.emsboot.modules.sys.service.UserService;
import com.baidu.xuper.api.Account;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

import static cn.pqz.emsboot.contract.ContractMethodConstant.PAY_FOR_SALARY;

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

    @RequestMapping("/getEmployeeSalary")
    public String getEmployeeSalary(Long userId) {
        return employeeService.getEmployeeSalary(userId);
    }

    @RequestMapping("/getSalary")
    public String getSalary(Long userId) {
        return employeeService.getSalary(userId);
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

    @RequestMapping("/invoke")
    @PostMapping
    public String invoke(Long userId, String method, @RequestBody Map<String, String> map){
        if (method.equals(PAY_FOR_SALARY)){
            return employeeService.payForSalary(userId, map);
        }
        return employeeService.invoke(userId, method, map);
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
}
