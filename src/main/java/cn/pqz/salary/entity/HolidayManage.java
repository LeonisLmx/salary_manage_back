package cn.pqz.salary.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author urey.liu
 * @date 2024/5/10 7:24 PM
 */
@TableName("holiday_manage")
@Data
public class HolidayManage {

    private Long id;

    private Long userId;

    private Date holidayStartTime;

    private Date holidayEndTime;

    private Long holidayDurationMinutes;

    private Integer approval;

    private Date createTime;

    private Date updateTime;
}
