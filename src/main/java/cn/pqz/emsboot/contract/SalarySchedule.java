package cn.pqz.emsboot.contract;

import cn.pqz.emsboot.modules.sys.DTO.UserDTO;
import cn.pqz.emsboot.modules.sys.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author urey.liu
 * @date 2024/5/8 5:15 PM
 */
@Slf4j
@Component
public class SalarySchedule {

    @Resource
    private UserService userService;

    @Resource
    private EmployeeService employeeService;

    @Scheduled(cron = "0 0 0 0/1 * ?")
    public void salaryPost() {
        List<UserDTO> list = userService.userList(1, 1000, "");
        for (UserDTO userDTO : list) {
            try {
                employeeService.payForSalary(userDTO.getId());
                log.info("success for pay userId {}", userDTO.getId());
            }  catch (Exception e){
                log.info("pay salary error by msg {}", e.getMessage());
            }
        }
    }
}
