package cn.pqz.emsboot.modules.sys.contoller;

import cn.pqz.emsboot.component.util.UserUtil;
import cn.pqz.emsboot.contract.EmployeeService;
import cn.pqz.emsboot.modules.sys.DTO.UserSalaryDetailDTO;
import cn.pqz.emsboot.modules.sys.entity.*;
import cn.pqz.emsboot.modules.sys.mapper.RoleMapper;
import cn.pqz.emsboot.modules.sys.mapper.UserMapper;
import cn.pqz.emsboot.modules.sys.mapper.UserSalaryDetailMapper;
import cn.pqz.emsboot.modules.sys.mapper.User_roleMapper;
import cn.pqz.emsboot.modules.sys.service.RoleService;
import cn.pqz.emsboot.modules.sys.service.UserService;
import cn.pqz.emsboot.modules.sys.service.User_roleService;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
    private User_roleService user_roleService;

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserSalaryDetailMapper userSalaryDetailMapper;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");//定义时间格式，用作文件夹命名
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
        boolean i = userService.updateById(user);
        employeeService.updateEmployee(user.getId().longValue(), user.getSalary().longValue(), user.getPayDuration(), 0L);
        return i?RespBean.ok("修改成功"):RespBean.error("修改失败");
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
        QueryWrapper query=new QueryWrapper();
        query.eq("uid",uid);
        user_roleService.remove(query);
        User_role ur=new User_role();
        User user=userService.getById(uid);
        Role role=roleService.getById(rid);
        user.setRoleName(role.getNameZh());//在user表中设置名称
        userService.updateById(user);//更新user表
        ur.setUid(uid);
        ur.setRid(rid);
        return user_roleService.save(ur)?RespBean.ok("分配角色成功"):RespBean.error("分配角色失败");

    }

    @PostMapping("/upload/{id}")
    public RespBean upload(@RequestParam("file") MultipartFile uploadFile,
                           @PathVariable("id") Integer id,
                           HttpServletRequest req){
        RespBean respBean = null;
        String realPath = "D:/uploadFile/";
        User user=userService.getById(id);
        String format = sdf.format(new Date());//定义一个时间点并格式化
        File folder = new File(realPath + format);//新建文件夹文件夹命名为uploadFile/时间
        if (!folder.isDirectory()) {
            folder.mkdirs(); //创建多级目录
        }
        String oldName = uploadFile.getOriginalFilename();//getOriginalFilename得到上传时的文件名
        String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."),
                oldName.length());
        try {
            uploadFile.transferTo(new File(folder, newName));//将文件保存到哪，文件名
            String filePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() +
                    "/uploadFile/" + format + newName;
            user.setUserface(filePath);
            userService.updateById(user);
            respBean=RespBean.ok("上传成功",filePath);

        } catch (Exception e) {
                e.printStackTrace();
                respBean=RespBean.error("上传失败");
        }
        return respBean;
    }

    @GetMapping("/postSalary")
    public RespBean postSalary(){
        Long userId = UserUtil.getCurrentUser().getId().longValue();
        User user = userService.getById(userId);
        if (System.currentTimeMillis() < user.getLastPayTime().getTime() + TimeUnit.DAYS.toSeconds(user.getPayDuration())){
            return RespBean.error("还未到发工资时间");
        }
        String s = employeeService.payForSalary(userId);
        if (StringUtils.equals("SUCCESS", s)){
            user.setLastPayTime(new Date());
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
