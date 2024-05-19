package cn.pqz.salary.component.util;


import cn.pqz.salary.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 获取用户信息
 */
public class UserUtil {
    public static User getCurrentUser() {
        return ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }
}
