package cn.pqz.salary.contoller;

import cn.pqz.salary.component.util.UserUtil;
import cn.pqz.salary.entity.RespBean;
import cn.pqz.salary.service.HolidayManageService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author urey.liu
 * @date 2024/5/10 7:38 PM
 */
@RequestMapping("/holiday")
@RestController
public class HolidayController {

    @Resource
    private HolidayManageService holidayManageService;

    @RequestMapping("/insert")
    public RespBean insert(Long startTime, Long endTime) {
        long userId = UserUtil.getCurrentUser().getId().longValue();
        String s = holidayManageService.insertRecord(userId, new Date(startTime), new Date(endTime));
        return RespBean.ok(s);
    }

    @RequestMapping("/approval")
    public RespBean approval(Long userId, Long id, Integer action) {
        return holidayManageService.approval(userId, id, action)? RespBean.ok("操作成功"): RespBean.error("操作失败");
    }

    @RequestMapping("/list")
    public RespBean list(@RequestParam(value = "userId", required = false)Long params,
                         @RequestParam("pageNum")Integer pageNumber,
                         @RequestParam("size")Integer pageSize) {
        long userId = UserUtil.getCurrentUser().getId().longValue();
        if (userId == 1) {
            return RespBean.ok("", holidayManageService.list(pageNumber, pageSize, params));
        }else{
            return RespBean.ok("", holidayManageService.list(pageNumber, pageSize, userId));
        }
    }

    @RequestMapping("/getConfigs")
    public RespBean getConfigs() {
        return RespBean.ok("", holidayManageService.listConfigs());
    }
}
