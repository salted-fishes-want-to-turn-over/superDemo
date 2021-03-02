package com.example.controller;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.common.utils.JWTUtils;
import com.example.common.utils.R;
import com.example.entity.User;
import com.example.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
public class UserController {
    @Autowired
    private IUserService userService;
    @GetMapping("/user/login")
    public Map<String,Object> login(User user) {
        Map<String,Object> result = new HashMap<>();
        log.info("用户名: [{}]", user.getName());
        log.info("密码: [{}]", user.getPassword());
        try {
            User userDB = userService.login(user);
            Map<String, String> map = new HashMap<>();//用来存放payload
            map.put("id",userDB.getId());
            map.put("username", userDB.getName());
            String token = JWTUtils.getToken(map);
            result.put("state",true);
            result.put("msg","登录成功!!!");
            result.put("token",token); //成功返回token信息
        } catch (Exception e) {
            e.printStackTrace();
            result.put("state","false");
            result.put("msg",e.getMessage());
        }
        return result;
    }

    @PostMapping("/user/getUserName")
    public R test(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        //处理自己业务逻辑
        String token = request.getHeader("token");
        DecodedJWT verify = JWTUtils.getToken(token);
        String userid = verify.getClaim("id").asString();
        String username = verify.getClaim("username").asString();

        log.info("用户id: [{}]", userid);
        log.info("用户name: [{}]", username);

        log.info(verify.getHeader());
        log.info(verify.getPayload());
        log.info(verify.getSignature());

        // 下面代码拦截器中会打出
//        try {
//            JWTUtils.verify(token);
//            map.put("msg", "验证通过~~~");
//            map.put("state", true);
//        } catch (TokenExpiredException e) {
//            map.put("state", false);
//            map.put("msg", "Token已经过期!!!");
//        } catch (SignatureVerificationException e){
//            map.put("state", false);
//            map.put("msg", "签名错误!!!");
//        } catch (AlgorithmMismatchException e){
//            map.put("state", false);
//            map.put("msg", "加密算法不匹配!!!");
//        } catch (Exception e) {
//            e.printStackTrace();
//            map.put("state", false);
//            map.put("msg", "无效token~~");
//        }
        return R.ok().setData(username);
    }
}
