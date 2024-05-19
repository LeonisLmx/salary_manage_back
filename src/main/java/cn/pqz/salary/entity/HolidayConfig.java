package cn.pqz.salary.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author urey.liu
 * @date 2024/5/13 10:54 AM
 */
@Data
public class HolidayConfig {

    private Long Id;

    private Date configTime;

    // 1 代表假期，-1代表工作日
    private Integer state;

    private Date createTime;

    private Date updateTime;
}
