package cn.pqz.emsboot.component.security;

import cn.pqz.emsboot.modules.sys.entity.RespBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author urey.liu
 * @date 2024/5/8 7:47 PM
 */
@Component
public class CustomAuthenticationFailureHandler implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RespBean error = RespBean.error("操作失败，请重新登录");
        out.write(new ObjectMapper().writeValueAsString(error));
        out.flush();
        out.close();
    }
}
