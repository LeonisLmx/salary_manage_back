package cn.pqz.salary.mapper;

import cn.pqz.salary.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> getAllMenus();
    List<Menu> menuList();
    List<Menu> allMenuList(String name);
    List<Menu> menuTree();
}
