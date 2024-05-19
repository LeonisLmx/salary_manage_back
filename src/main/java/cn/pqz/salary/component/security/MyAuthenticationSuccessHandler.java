package cn.pqz.salary.component.security;

import cn.pqz.salary.component.util.UserUtil;
import cn.pqz.salary.entity.RespBean;
import cn.pqz.salary.entity.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Component
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");
        HttpSession session = request.getSession();
        User user = UserUtil.getCurrentUser();
        session.setAttribute("user",user);
        RespBean respBean = RespBean.ok("登录成功", user);////////
        ObjectMapper om = new ObjectMapper();
        PrintWriter out = response.getWriter();
        out.write(om.writeValueAsString(respBean));
        out.flush();
        out.close();
    }
}
