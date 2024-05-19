package cn.pqz.salary.contoller;

import cn.pqz.salary.component.security.smscode.SmsCode;
import cn.pqz.salary.component.util.VerificationCode;
import cn.pqz.salary.entity.RespBean;
import cn.pqz.salary.entity.User;
import cn.pqz.salary.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 */
@Slf4j
@RestController
public class LoginController {
    @Resource
    UserMapper userMapper;

    /**
     * 验证码处理
     *
     * @param session  前端session
     * @param response 传入前端的数据
     */
    @GetMapping("/verifyCode")
    public void verifyCode(HttpSession session, HttpServletResponse response) throws IOException {
        VerificationCode code = new VerificationCode();
        BufferedImage img = code.getImage();
        String text = code.getText();
        session.setAttribute("verify_code", text);
        VerificationCode.output(img, response.getOutputStream());
    }

    /**
     *
     * @param mobile 前端传的手机号
     * @param session 保存验证码的地方
     * @return
     */
    @GetMapping("/smsCode")
    public RespBean sms(@RequestParam("mobile") String mobile, HttpSession session) {
        User user=userMapper.loadUserByUsername(mobile);
        if (user == null){
            return RespBean.error("该手机号未曾注册");
        }
        SmsCode smsCode = new SmsCode(
                RandomStringUtils.randomNumeric(4), 60, mobile);
        log.info(smsCode.getCode() + "->" + mobile);
        session.setAttribute("sms_key",smsCode);
        return RespBean.ok("短信验证码已经发送,1分钟内有效");
    }


}
