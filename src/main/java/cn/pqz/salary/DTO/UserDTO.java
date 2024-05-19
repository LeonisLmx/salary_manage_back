package cn.pqz.salary.DTO;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author urey.liu
 * @date 2024/4/29 2:49 PM
 */
@Data
public class UserDTO {

    private Long id;

    private String roleName;

    private String email;

    private boolean enabled;

    private String name;

    private String phone;

    private String username;

    private BigDecimal salary;

    private Long payDuration;

    private String payUnit;

    private Date nextPayTime;

    private Integer salaryEnabled;

    private String balance;

    private Long workInCompanyTime;

    private Long workInCompanyDays;
}
