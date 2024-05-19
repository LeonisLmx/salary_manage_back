package cn.pqz.salary.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author urey.liu
 * @date 2024/5/7 5:02 PM
 */
@Data
public class UserSalaryDetail {

    private Long id;

    private Long userId;

    private BigDecimal shouldSalary;

    private BigDecimal actualSalary;

    private String hashId;

    private Long shouldDuration;

    private Long actualDuration;

    private Date createTime;

    private Date updateTime;
}
