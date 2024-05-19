package cn.pqz.salary.contoller;

import cn.pqz.salary.component.util.UserUtil;
import cn.pqz.salary.entity.Menu;
import cn.pqz.salary.entity.MenuRole;
import cn.pqz.salary.entity.RespBean;
import cn.pqz.salary.entity.UserRole;
import cn.pqz.salary.mapper.MenuMapper;
import cn.pqz.salary.mapper.Menu_roleMapper;
import cn.pqz.salary.mapper.User_roleMapper;
import cn.pqz.salary.service.MenuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@RestController
public class MenuController {
    @Autowired
    private MenuService menuService;

    @Resource
    private User_roleMapper user_roleMapper;

    @Resource
    private Menu_roleMapper menuRoleMapper;

    @Resource
    private MenuMapper menuMapper;

    /**
     * 获取菜单列表
     * @return
     */
    @GetMapping("/menuList")
    public RespBean menuList(){
        Long userId = UserUtil.getCurrentUser().getId().longValue();
        List<UserRole> userRoles = user_roleMapper.selectList(new LambdaQueryWrapper<UserRole>().eq(UserRole::getUid, userId.intValue()));
        List<Integer> collect = userRoles.stream().map(UserRole::getRid).collect(Collectors.toList());
        List<MenuRole> menuRoles = menuRoleMapper.selectList(new LambdaQueryWrapper<MenuRole>().in(MenuRole::getRid, collect));
        List<Menu> menus = menuMapper.selectList(new LambdaQueryWrapper<Menu>().in(Menu::getId, menuRoles.stream().map(MenuRole::getMid).collect(Collectors.toList())));
        Map<Integer, Menu> map = menus.stream().collect(Collectors.toMap(Menu::getId, Function.identity()));
        for (Menu value : map.values()) {
            Menu menu = map.get(value.getParentId());
            if (menu != null){
                if (menu.getChildren() == null){
                    List<Menu> list = new ArrayList<>();
                    list.add(value);
                    menu.setChildren(list);
                }else {
                    menu.getChildren().add(value);
                }
            }
        }
        List<Menu> list = map.values().stream().filter(n -> n.getLevel() == 0).sorted(Comparator.comparing(Menu::getId)).collect(Collectors.toList());
        return RespBean.ok("", list);
    }

    /**
     * 获取权限列表
     * @return
     */
    @GetMapping("/staff/powList/")
    public RespBean allMenuList(@RequestParam("query") String query){
        List<MenuRole> menuRoles = menuRoleMapper.selectList(new LambdaQueryWrapper<MenuRole>().in(MenuRole::getRid, Integer.parseInt(query)));
        Map<Integer, Menu> map = menuService.allMenuList(query).stream().collect(Collectors.toMap(Menu::getId, Function.identity()));
        for (Menu value : map.values()) {
            Menu menu = map.get(value.getParentId());
            if (menu != null){
                if (menu.getChildren() == null){
                    List<Menu> list = new ArrayList<>();
                    list.add(value);
                    menu.setChildren(list);
                }else {
                    menu.getChildren().add(value);
                }
            }
        }
        Map<String, Object> res = new HashMap<>();
        res.put("all", map.values().stream().filter(n -> n.getLevel() == 0).collect(Collectors.toList()));
        res.put("current", menuRoles.stream().map(MenuRole::getMid).collect(Collectors.toList()));
        return RespBean.ok("", res);
    }

    /**
     * 是否在菜单栏显示
     */
    @PutMapping("/staff/changeMenuEnable/{id}/{enable}")
    public RespBean changeMenuEnable(@PathVariable("id") Integer id,
                                     @PathVariable("enable") Boolean enable){
        RespBean respBean=null;
        Menu menu=new Menu();
        menu.setId(id);
        menu.setEnable(enable);
        Boolean i=menuService.updateById(menu);
        if (i){
            respBean=RespBean.ok("更新状态成功");
        }else{
            respBean=RespBean.error("更新状态失败");
        }
        return respBean;
    }
    /**
     * 添加权限
     */
    @PostMapping("/staff/addPow")
    public RespBean addPow(@RequestBody Menu menu){
        RespBean respBean=null;
        Boolean i=menuService.save(menu);
        if (i){
            respBean=RespBean.ok("权限添加成功");
        }
        else {
            respBean=RespBean.error("权限添加失败");
        }
        return respBean;
    }
    /**
     * 修改权限
     */
    @PutMapping("/staff/editPow")
    public RespBean editPow(@RequestBody Menu menu){
        RespBean respBean=null;
        Boolean i=menuService.updateById(menu);
        if (i){
            respBean=RespBean.ok("权限修改成功");
        }
        else {
            respBean=RespBean.error("权限修改失败");
        }
        return respBean;
    }

    /**
     * 删除权限
     * @param id
     * @return
     */
    @DeleteMapping("/staff/deletePow/{id}")
    public RespBean deletePow(@PathVariable("id") Integer id ){
        RespBean respBean=null;
        Boolean i = menuService.removeById(id);
        if (i){
            respBean=RespBean.ok("权限删除成功");
        }
        else {
            respBean=RespBean.error("权限删除失败");
        }
        return respBean;
    }

}
