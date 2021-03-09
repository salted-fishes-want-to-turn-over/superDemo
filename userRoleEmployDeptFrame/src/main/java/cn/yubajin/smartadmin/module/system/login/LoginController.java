package cn.yubajin.smartadmin.module.system.login;

import cn.yubajin.smartadmin.common.anno.NoNeedLogin;
import cn.yubajin.smartadmin.common.anno.NoValidPrivilege;
import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeLoginFormDTO;
import cn.yubajin.smartadmin.module.system.login.domain.LoginDetailVO;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.util.SmartRequestTokenUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * 后台登录
 *
 * @author lidoudou
 * @date 2017年12月19日上午11:46:04
 */
@RestController
@Api(tags = {SwaggerTagConst.Admin.MANAGER_USER_LOGIN})
@OperateLog
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/session/login")
    @ApiOperation(value = "登录", notes = "登录")
    @NoNeedLogin
    public ResponseDTO<LoginDetailVO> login(@Valid @RequestBody EmployeeLoginFormDTO loginForm, HttpServletRequest request) {
        return loginService.login(loginForm, request);
    }

    @GetMapping("/session/get")
    @ApiOperation(value = "获取session", notes = "获取session")
    @NoValidPrivilege
    public ResponseDTO<LoginDetailVO> getSession() {
        /**
         *
         *发送请求时，先执行了拦截器，
         * 如果带了token值，
         * 拦截器执行SmartRequestTokenUtil.setUser(request, requestToken);
         * 放token值在SmartRequestTokenUtil的USER_KEY属性中
         * 故此处可以SmartRequestTokenUtil.getRequestUser()获取用户信息
         */
        RequestTokenBO requestUser = SmartRequestTokenUtil.getRequestUser();
        return ResponseDTO.succData(loginService.getSession(requestUser));
    }

    @GetMapping("/session/logOut")
    @ApiOperation(value = "退出登陆", notes = "退出登陆")
    @NoValidPrivilege
    public ResponseDTO<Boolean> logOut() {
        RequestTokenBO requestToken = SmartRequestTokenUtil.getRequestUser();
        if (null == requestToken) {
            return ResponseDTO.wrap(LoginResponseCodeConst.LOGIN_ERROR);
        }
        return loginService.logoutByToken(requestToken);
    }

}
