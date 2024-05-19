package cn.pqz.salary.service;

import cn.pqz.salary.entity.MenuRole;
import cn.pqz.salary.mapper.Menu_roleMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MenuRoleService extends ServiceImpl<Menu_roleMapper, MenuRole> {
    @Autowired
    private Menu_roleMapper menu_roleMapper;

    /**
     * 先删除权限然后添加权限
     * @param rid
     * @param mids
     */
    public void assPow(String rid,String mids){
        Integer rid1=Integer.parseInt(rid);
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("rid",rid1);
        menu_roleMapper.delete(queryWrapper);
        String arr[] = mids.split(",");
        Integer[] mid=new Integer[arr.length];
        for (int i=0;i<arr.length;i++){
            mid[i]=Integer.parseInt(arr[i]);
        }
        for (int i=0;i<mid.length;i++){
            MenuRole mr=new MenuRole();
            mr.setRid(rid1);
            mr.setMid(mid[i]);
            menu_roleMapper.insert(mr);
        }

    }
}
