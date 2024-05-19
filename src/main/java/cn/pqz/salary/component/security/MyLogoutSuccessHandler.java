package cn.pqz.salary.component.security;

import cn.pqz.salary.entity.RespBean;
import cn.pqz.salary.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Component
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {
    private static ObjectMapper objectMapper=new ObjectMapper();
    @Override
    public void onLogoutSuccess(HttpServletRequest request,
                                HttpServletResponse response,
                                Authentication authentication) throws IOException, ServletException {
        RespBean respBean;
        response.setContentType("application/json;charset=utf-8");
        respBean = RespBean.ok("已经注销登录成功");
        response.getWriter().write(objectMapper.writeValueAsString(respBean));
    }
}
