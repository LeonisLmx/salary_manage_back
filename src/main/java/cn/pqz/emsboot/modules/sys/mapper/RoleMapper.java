package cn.pqz.emsboot.modules.sys.mapper;

import cn.pqz.emsboot.modules.sys.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
     List<Role> getRoleList();
}
