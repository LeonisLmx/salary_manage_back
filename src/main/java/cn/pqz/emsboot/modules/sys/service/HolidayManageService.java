package cn.pqz.emsboot.modules.sys.service;

import cn.pqz.emsboot.contract.EmployeeService;
import cn.pqz.emsboot.modules.sys.DTO.HolidayManageDTO;
import cn.pqz.emsboot.modules.sys.entity.HolidayManage;
import cn.pqz.emsboot.modules.sys.entity.User;
import cn.pqz.emsboot.modules.sys.mapper.HolidayManageMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author urey.liu
 * @date 2024/5/10 7:26 PM
 */
@Slf4j
@Service
public class HolidayManageService {

    @Resource
    private HolidayManageMapper holidayManageMapper;

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserService userService;

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
        holidayManageMapper.insert(holidayManage);
        return "请假成功";
    }

    public boolean approval(Long userId, Long id, Integer action) {
        holidayManageMapper.update(null, new LambdaUpdateWrapper<HolidayManage>()
                .eq(HolidayManage::getUserId, userId)
                .eq(HolidayManage::getId, id)
                .set(HolidayManage::getApproval, action));
        if (action == 1){
            User user = userService.getById(userId);
            HolidayManage holidayManage = holidayManageMapper.selectOne(new LambdaQueryWrapper<HolidayManage>().eq(HolidayManage::getId, id));
            if (holidayManage == null){
                return false;
            }
            long diff = (holidayManage.getHolidayEndTime().getTime() - holidayManage.getHolidayStartTime().getTime()) / DateUtils.MILLIS_PER_MINUTE;
            employeeService.updateEmployee(userId, user.getSalary().longValue(), user.getPayDuration(), diff);
        }
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
}
