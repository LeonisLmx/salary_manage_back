package cn.pqz.salary.mapper;

import cn.pqz.salary.entity.Role;
import cn.pqz.salary.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    User loadUserByUsername(String username);
    List<Role> getUserRolesByUid(Integer id);

}