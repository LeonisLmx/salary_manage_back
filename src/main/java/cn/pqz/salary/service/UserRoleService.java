package cn.pqz.salary.service;

import cn.pqz.salary.entity.UserRole;
import cn.pqz.salary.mapper.User_roleMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@Slf4j
public class UserRoleService extends ServiceImpl<User_roleMapper, UserRole> {
    @Autowired
    User_roleMapper user_roleMapper;
    public boolean save(UserRole entity) {
        int i = user_roleMapper.insert(entity);
        if (i!=0){
            log.info("分配角色");
            return true;
        } else {
            return false;
        }

    }
}
