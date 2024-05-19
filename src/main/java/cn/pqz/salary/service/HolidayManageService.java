package cn.pqz.salary.service;

import cn.pqz.salary.contract.EmployeeService;
import cn.pqz.salary.DTO.HolidayManageDTO;
import cn.pqz.salary.entity.HolidayConfig;
import cn.pqz.salary.entity.HolidayManage;
import cn.pqz.salary.entity.User;
import cn.pqz.salary.mapper.HolidayConfigMapper;
import cn.pqz.salary.mapper.HolidayManageMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author urey.liu
 * @date 2024/5/10 7:26 PM
 */
@Slf4j
@Service
public class HolidayManageService implements InitializingBean {

    private static final Long PER_DAY_HOUR = 8L;

    private static final Long MINUTES = 60L;

    private static final Long PER_DAY_MINUTES = PER_DAY_HOUR * MINUTES;

    private static final List<Long> HOLIDAY_LIST = new ArrayList<>();

    private static final List<Long> WORK_LIST = new ArrayList<>();

    @Resource
    private HolidayManageMapper holidayManageMapper;

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserService userService;

    @Resource
    private HolidayConfigMapper holidayConfigMapper;

    @Override
    public void afterPropertiesSet() throws Exception {
        List<HolidayConfig> holidayConfigs = holidayConfigMapper.selectList(new LambdaQueryWrapper<>());
        for (HolidayConfig holidayConfig : holidayConfigs) {
            if (holidayConfig.getState() == 1){
                HOLIDAY_LIST.add(holidayConfig.getConfigTime().getTime());
            }else{
                WORK_LIST.add(holidayConfig.getConfigTime().getTime());
            }
        }
    }

    public String insertRecord(Long userId, Date startTime, Date endTime) {
        List<HolidayManage> holidayManages = holidayManageMapper.selectList(new LambdaQueryWrapper<HolidayManage>()
                .eq(HolidayManage::getUserId, userId).in(HolidayManage::getApproval, Arrays.asList(0, 1)));
        for (HolidayManage holidayManage : holidayManages) {
            if (!checkTime(startTime, endTime, holidayManage)){
                return "当前区间已经存在假期，无法重复添加";
            }
        }
        HolidayManage holidayManage = new HolidayManage();
        holidayManage.setUserId(userId);
        holidayManage.setHolidayStartTime(startTime);
        holidayManage.setHolidayEndTime(endTime);
        holidayManage.setApproval(0);
        long diff = workMinutesBetweenTime(holidayManage.getHolidayStartTime(), holidayManage.getHolidayEndTime());
        holidayManage.setHolidayDurationMinutes(diff);
        holidayManageMapper.insert(holidayManage);
        return "请假成功";
    }

    public boolean approval(Long userId, Long id, Integer action) {
        holidayManageMapper.update(null, new LambdaUpdateWrapper<HolidayManage>()
                .eq(HolidayManage::getUserId, userId)
                .eq(HolidayManage::getId, id)
                .set(HolidayManage::getApproval, action));
        return true;
    }

    public Page<HolidayManageDTO> list(Integer pageNumber, Integer pageSize, Long userId) {
        LambdaQueryWrapper<HolidayManage> lambdaQueryWrapper = new LambdaQueryWrapper<HolidayManage>().orderByDesc(HolidayManage::getId);
        if (userId != null){
            lambdaQueryWrapper.eq(HolidayManage::getUserId, userId);
        }
        List<HolidayManageDTO> list = new ArrayList<>();
        Page<HolidayManage> holidayManagePage = holidayManageMapper.selectPage(new Page<>(pageNumber, pageSize), lambdaQueryWrapper);
        for (HolidayManage record : holidayManagePage.getRecords()) {
            HolidayManageDTO holidayManageDTO = new HolidayManageDTO();
            BeanUtils.copyProperties(record, holidayManageDTO);
            holidayManageDTO.setName(userService.getById(record.getUserId()).getName());
            list.add(holidayManageDTO);
        }
        Page<HolidayManageDTO> page = new Page<>();
        page.setRecords(list);
        page.setTotal(holidayManagePage.getTotal());
        return page;
    }

    private boolean checkTime(Date startTime, Date endTime, HolidayManage holidayManage) {
        if (holidayManage.getHolidayStartTime().before(startTime) && holidayManage.getHolidayStartTime().after(endTime)){
            return false;
        }
        if (holidayManage.getHolidayStartTime().after(startTime) && holidayManage.getHolidayStartTime().before(endTime)){
            return false;
        }
        return true;
    }

    private static long dateDiffMinutes(DateTime date1, DateTime date2) {
        return (date2.getMillis() - date1.getMillis()) / DateUtils.MILLIS_PER_MINUTE;
    }

    public long workMinutesBetweenTime(Date startTime, Date endTime) {
        long diff = 0;
        DateTime holidayStartTime = new DateTime(startTime);
        DateTime holidayEndTime = new DateTime(endTime);
        while (holidayStartTime.isBefore(holidayEndTime)){
            if (DateUtils.isSameDay(holidayStartTime.toDate(), holidayEndTime.toDate())){
                diff +=  dateDiffMinutes(holidayStartTime, holidayEndTime);
                break;
            }
            // 节假日不计算，直接跳过
            if (HOLIDAY_LIST.contains(holidayStartTime.getMillis())){
                holidayStartTime = holidayStartTime.plusDays(1).withHourOfDay(9);
                continue;
            }
            // 周六周末查看是否需要补班
            if (holidayStartTime.getDayOfWeek() == 6 || holidayStartTime.getDayOfWeek() == 7) {
                if (WORK_LIST.contains(holidayStartTime.getMillis())){
                    diff += 8 * 60;
                }
                holidayStartTime = holidayStartTime.plusDays(1).withHourOfDay(9);
                continue;
            }
            diff += ((17 - holidayStartTime.hourOfDay().get()) * 60L);
            holidayStartTime = holidayStartTime.plusDays(1).withHourOfDay(9);
        }
        return diff;
    }
    public Map<String, Object> listConfigs() {
        Map<String, Object> map = new HashMap<>();
        map.put("works", holidayConfigMapper.selectList(new LambdaQueryWrapper<HolidayConfig>().eq(HolidayConfig::getState, -1)).stream().map(n -> n.getConfigTime().getTime()).collect(Collectors.toList()));
        map.put("holidays", holidayConfigMapper.selectList(new LambdaQueryWrapper<HolidayConfig>().eq(HolidayConfig::getState, 1)).stream().map(n -> n.getConfigTime().getTime()).collect(Collectors.toList()));
        return map;
    }

    public Long calcUsersHolidayInTime(Long userId, long current) {
        User user = userService.getById(userId);
        long lastPayTime = user.getLastPayTime().getTime();
        long minutes = 0;
        if (lastPayTime == current){
            return minutes;
        }
        List<HolidayManage> holidayManages = holidayManageMapper.selectList(new LambdaQueryWrapper<HolidayManage>().ge(HolidayManage::getHolidayEndTime, new Date(lastPayTime))
                .le(HolidayManage::getHolidayStartTime, new Date(lastPayTime)).eq(HolidayManage::getApproval, 1));
        for (HolidayManage holidayManage : holidayManages) {
            if (holidayManage.getHolidayEndTime().after(new Date(current))){
                break;
            }
            minutes += workMinutesBetweenTime(new Date(lastPayTime), holidayManage.getHolidayEndTime());
        }
        List<HolidayManage> holidayManages1 = holidayManageMapper.selectList(new LambdaQueryWrapper<HolidayManage>().ge(HolidayManage::getHolidayStartTime, new Date(lastPayTime))
                .le(HolidayManage::getHolidayStartTime, new Date(current)).eq(HolidayManage::getApproval, 1));
        for (HolidayManage holidayManage : holidayManages1) {
            if (holidayManage.getHolidayEndTime().before(new Date(current))){
                minutes += holidayManage.getHolidayDurationMinutes();
            }else{
                minutes += workMinutesBetweenTime(holidayManage.getHolidayStartTime(), new Date(current));
            }
        }
        return minutes;
    }

    public Date nextPayTime(DateTime startTime, Long payDuration, String payUnit) {
        if (payUnit.equals("DAYS")){
            return nextPayTime(startTime, payDuration * PER_DAY_MINUTES);
        }
        if (payUnit.equals("HOURS")){
            return nextPayTime(startTime, payDuration * MINUTES);
        }
        return nextPayTime(startTime, payDuration);
    }

    private Date nextPayTime(DateTime startTime, Long payDuration) {
        DateTime time = startTime.withHourOfDay(17).withMinuteOfHour(0);
        long diff = dateDiffMinutes(startTime, time);
        if (payDuration < diff){
            return startTime.plusMinutes(payDuration.intValue()).toDate();
        }
        payDuration -= diff;
        DateTime start = startTime.withHourOfDay(9).withMinuteOfHour(0).plusDays(1);
        while (payDuration > 0) {
            while (HOLIDAY_LIST.contains(start.getMillis()) ||
                    ((start.getDayOfWeek() == 6 || start.getDayOfWeek() == 7) && !WORK_LIST.contains(start.getMillis()))) {
                start = start.plusDays(1);
            }
            if (payDuration < PER_DAY_MINUTES){
                return start.plusMinutes(payDuration.intValue()).toDate();
            }
            payDuration -= PER_DAY_MINUTES;
            start = start.plusDays(1);
        }
        return new Date();
    }
}
