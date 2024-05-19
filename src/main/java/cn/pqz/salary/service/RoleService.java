package cn.pqz.salary.service;

import cn.pqz.salary.entity.Role;
import cn.pqz.salary.mapper.RoleMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleService extends ServiceImpl<RoleMapper,Role> {
    @Autowired
    private RoleMapper roleMapper;

    public int addRole(Role role){
        String name="ROLE_"+role.getName();
        role.setName(name);
        int i=roleMapper.insert(role);
        return i;
    }

    public int editRole(Role role){
        int i=roleMapper.updateById(role);
        return i;
    }
    public List<Role> getRoleList(){
        return roleMapper.getRoleList();
    }
}
