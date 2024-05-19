package cn.pqz.salary.contract;

import cn.pqz.salary.DTO.UserDTO;
import cn.pqz.salary.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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

    // 早上9点-下午5点之间，每分钟执行一次
    @Scheduled(cron = "0 0/1 9-17 * * ?")
    public void salaryPost() {
        List<UserDTO> list = userService.userList(1, 1000, "");
        long time = new DateTime().withSecondOfMinute(0).withMillisOfSecond(0).getMillis();
        for (UserDTO userDTO : list) {
            if (new Date(time).before(userDTO.getNextPayTime())){
                log.info("current time is not pay for {} time", userDTO.getUsername());
                continue;
            }
            if (userDTO.getSalaryEnabled() == 0){
                log.info("current user {} can not for salary", userDTO.getUsername());
                continue;
            }
            try {
                employeeService.payForSalary(userDTO.getId());
                log.info("success for pay userId {}", userDTO.getId());
            }  catch (Exception e){
                log.info("pay salary error by msg {}", e.getMessage());
            }
        }
    }
}
