package cn.pqz.salary.contoller;

import cn.pqz.salary.DTO.UserSalaryDetailDTO;
import cn.pqz.salary.component.util.UserUtil;
import cn.pqz.salary.contract.EmployeeService;
import cn.pqz.salary.entity.*;
import cn.pqz.salary.mapper.UserSalaryDetailMapper;
import cn.pqz.salary.service.HolidayManageService;
import cn.pqz.salary.service.RoleService;
import cn.pqz.salary.service.UserRoleService;
import cn.pqz.salary.service.UserService;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;


@RestController
@RequestMapping("/employee")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserRoleService userRoleService;

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserSalaryDetailMapper userSalaryDetailMapper;

    @Resource
    private HolidayManageService holidayManageService;

    /**
     * 展示用户列表
     * @param pageNum
     * @param size
     * @param query
     * @return
     */
    @GetMapping("/userList/")
    public RespBean userList(@RequestParam("pageNum") Integer pageNum,
                             @RequestParam("size") Integer size,
                             @RequestParam("query") String query){
        JSONObject obj=new JSONObject();
        obj.put("data",userService.userList(pageNum,size,query));
        obj.put("total",userService.count(null));
        return RespBean.ok("",obj);
    }

    /**
     * 改变用户状态enable
     * @param id
     * @param enabled
     * @return
     */
    @PutMapping("/updateEnabled/{userId}/{userEnabled}")
    public RespBean updateEnabled(@PathVariable("userId") Integer id,
                                  @PathVariable("userEnabled") Boolean enabled,
                                  HttpServletRequest request){
        User user = new User();
        user.setId(id);
        user.setEnabled(enabled);
        return userService.updateById(user)?RespBean.ok("更新状态成功"):RespBean.error("更新状态失败");
    }
    @PostMapping("/addUser")
    public RespBean addUser(@RequestBody User user){
        String phone=user.getPhone();
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("phone",phone);
        User user1 = userService.getOne(queryWrapper);
        if (!Objects.isNull(user1)){
            return RespBean.error(phone+"已经注册");
        }else {
            int i = userService.addUser(user);
            if (i!=0){
                return RespBean.ok("添加成功");
            }else{
                return RespBean.error("添加失败");
            }
        }
    }
    @PutMapping("/updateUser")
    public RespBean updateUser(@RequestBody User user){
        Date date = holidayManageService.nextPayTime(new DateTime(user.getLastPayTime()), user.getPayDuration(), user.getPayUnit());
        boolean i = userService.updateById(user);
        if (date.getTime() != user.getNextPayTime().getTime()) {
            employeeService.payForSalary(user.getId().longValue());
        }
        return i?RespBean.ok("修改成功"):RespBean.error("修改失败");
    }

    @PutMapping("/updateUserPayState")
    public RespBean updateUserPayState(Long userId, Integer action) {
        User user = userService.getById(userId);
        user.setSalaryEnabled(action);
        userService.updateById(user);
        if (action == 1){
            employeeService.payForSalary(userId);
        }
        employeeService.updateEmployee(userId);
        return RespBean.ok("修改成功");
    }

    @DeleteMapping("/deleteUser/{id}")
    public RespBean deleteUser(@PathVariable("id") Integer id){
        boolean i = userService.removeById(id);
        employeeService.delEmployee(id.longValue());
        return i?RespBean.ok("删除成功"):RespBean.error("删除失败");
    }

    /**
     * 角色列表
     * @return
     */
    @GetMapping("/allRole")
    public RespBean allRole(){
        List<Role> allRole = roleService.list();
        if (allRole!=null)
            return RespBean.ok("",allRole);
        else
            return RespBean.error("获取错误");
    }

    /**
     * 分配角色
     * @param uid
     * @param rid
     * @return
     */
    @PutMapping("/addUr/{uid}/{rid}")
    public RespBean addUr(@PathVariable("uid") Integer uid,
                          @PathVariable("rid") Integer rid){
        userRoleService.remove(new LambdaQueryWrapper<UserRole>().eq(UserRole::getUid, uid));
        UserRole ur = new UserRole();
        User user = userService.getById(uid);
        Role role = roleService.getById(rid);
        user.setRoleName(role.getNameZh());//在user表中设置名称
        userService.updateById(user);//更新user表
        ur.setUid(uid);
        ur.setRid(rid);
        return userRoleService.save(ur)?RespBean.ok("分配角色成功"):RespBean.error("分配角色失败");

    }

    @PostMapping("/upload/{id}")
    public RespBean upload(@RequestParam("file") MultipartFile uploadFile,
                           @PathVariable("id") Integer id) throws IOException {
        User user = userService.getById(id);
        File file = new File("static/");
        if (!file.exists()){
            file.mkdirs();
        }
        String newName = UUID.randomUUID().toString();
        try {
            uploadFile.transferTo(new File(file.getAbsolutePath() + "/" + newName + ".jpeg"));
            user.setUserface(newName);
            userService.updateById(user);
            return RespBean.ok("上传成功", userService.pngToBase64(newName));

        } catch (Exception e) {
            e.printStackTrace();
            return RespBean.error("上传失败");
        }
    }

    @GetMapping("/postSalary")
    public RespBean postSalary(@RequestParam("userId") Long userId){
        String s = employeeService.payForSalary(userId);
        if (StringUtils.equals("SUCCESS", s)){
            return RespBean.ok("支付工资成功");
        }
        return RespBean.error("支付工资失败");
    }

    @GetMapping("/getBalanceDetails")
    public RespBean getBalanceDetails(@RequestParam("pageNum") Integer pageNum,
                                      @RequestParam("size") Integer size){
        long userId = UserUtil.getCurrentUser().getId().longValue();
        LambdaQueryWrapper<UserSalaryDetail> queryWrapper = new LambdaQueryWrapper<>();
        if (userId != 1){
            queryWrapper.eq(UserSalaryDetail::getUserId, userId);
        }
        Page<UserSalaryDetail> userSalaryDetailPage = userSalaryDetailMapper.selectPage(new Page<>(pageNum, size), queryWrapper);
        List<UserSalaryDetailDTO> list = new ArrayList<>();
        for (UserSalaryDetail record : userSalaryDetailPage.getRecords()) {
            UserSalaryDetailDTO userSalaryDetailDTO = new UserSalaryDetailDTO();
            BeanUtils.copyProperties(record, userSalaryDetailDTO);
            userSalaryDetailDTO.setName(userService.getById(userSalaryDetailDTO.getUserId()).getName());
            list.add(userSalaryDetailDTO);
        }
        Page<UserSalaryDetailDTO> page = new Page<>();
        page.setTotal(userSalaryDetailPage.getTotal());
        page.setRecords(list);
        return RespBean.ok("", page);
    }

    @GetMapping("/getSalaryDetail")
    public RespBean getSalaryDetail(@RequestParam("pageNum") Integer pageNum,
                                    @RequestParam("size") Integer size,
                                    @RequestParam("query") String query) {
        long userId = UserUtil.getCurrentUser().getId().longValue();
        if (userId == 1) {
            return RespBean.ok("", userService.userSalary(pageNum, size, query));
        }else{
            return RespBean.ok("", userService.userSalary(pageNum, size, String.valueOf(userId)));
        }
    }
}
