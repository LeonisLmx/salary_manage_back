package cn.pqz.emsboot.modules.sys.service;

import cn.pqz.emsboot.modules.sys.entity.Menu;
import cn.pqz.emsboot.modules.sys.mapper.MenuMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Service
@Transactional
public class MenuService extends ServiceImpl<MenuMapper,Menu> {
    private Logger logger=Logger.getLogger(getClass());
    @Autowired
    private MenuMapper menuMapper;

    public List<Menu> getAllMenus(){
        return menuMapper.getAllMenus();
    }


    public boolean updateById(Menu entity) {
        int b=menuMapper.updateById(entity);
        if (b==0){
            return false;
        }else {
            return true;
        }
    }


    public boolean save(Menu entity) {
        int b=menuMapper.insert(entity);
        if (b==0){
            return false;
        }else {
            return true;
        }
    }


    public boolean removeById(Serializable id) {
        int i=menuMapper.deleteById(id);
        if (i==0){
            return false;
        }else {
            return true;
        }
    }


    public List<Menu> menuList(){return menuMapper.menuList();}
    public List<Menu> allMenuList(String name){return menuMapper.allMenuList(name);}
}
