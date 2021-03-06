package cn.yubajin.smartadmin.module.system.login;

import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.CommonConst;
import cn.yubajin.smartadmin.module.system.department.DepartmentDao;
import cn.yubajin.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import cn.yubajin.smartadmin.module.system.employee.EmployeeDao;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeResponseCodeConst;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeStatusEnum;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeLoginFormDTO;
import cn.yubajin.smartadmin.module.system.login.domain.KaptchaVO;
import cn.yubajin.smartadmin.module.system.login.domain.LoginDetailVO;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.module.system.privilege.service.PrivilegeEmployeeService;
import cn.yubajin.smartadmin.util.SmartBeanUtil;
import cn.yubajin.smartadmin.util.SmartDigestUtil;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * [  ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2018 1024lab.netInc. All rights reserved.
 * @date 2019/3/27 0027 下午 18:10
 * @since JDK1.8
 */
@Slf4j
@Service
public class LoginService {

    private static final String VERIFICATION_CODE_REDIS_PREFIX = "vc_%s";

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private LoginTokenService loginTokenService;

    @Autowired
    private PrivilegeEmployeeService privilegeEmployeeService;

    @Autowired
    private DefaultKaptcha defaultKaptcha;


    /**
     * 登陆
     *
     * @param loginForm 登录名 密码
     * @return 登录用户基本信息
     */
    public ResponseDTO<LoginDetailVO> login(@Valid EmployeeLoginFormDTO loginForm, HttpServletRequest request) {

        String loginPwd = SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, loginForm.getLoginPwd());
        EmployeeDTO employeeDTO = employeeDao.login(loginForm.getLoginName(), loginPwd);
        if (null == employeeDTO) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.LOGIN_FAILED);
        }
        if (EmployeeStatusEnum.DISABLED.equalsValue(employeeDTO.getIsDisabled())) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.IS_DISABLED);
        }
        //jwt token赋值
        String compactJws = loginTokenService.generateToken(employeeDTO);

        LoginDetailVO loginDTO = SmartBeanUtil.copy(employeeDTO, LoginDetailVO.class);

        //获取前端功能权限 ///////////////////

        loginDTO.setXAccessToken(compactJws);
        DepartmentEntity departmentEntity = departmentDao.selectById(employeeDTO.getDepartmentId());
        loginDTO.setDepartmentName(departmentEntity.getName());

        //判断是否为超管 ////////////////////
//        loginDTO.setIsSuperMan(isSuperman);
        //登陆操作日志 ////////////////////
        return ResponseDTO.succData(loginDTO);
    }

    public LoginDetailVO getSession(RequestTokenBO requestUser) {
        LoginDetailVO loginDTO = SmartBeanUtil.copy(requestUser.getEmployeeBO(), LoginDetailVO.class);
        //判断是否为超管 ///////////////////

        return loginDTO;
    }


    /**
     * 手机端退出登陆，清除token缓存
     *
     * @param requestToken
     * @return 退出登陆是否成功，bool
     */
    public ResponseDTO<Boolean> logoutByToken(RequestTokenBO requestToken) {
        privilegeEmployeeService.removeCache(requestToken.getRequestUserId());
        return ResponseDTO.succ();
    }

    /**
     * 获取验证码
     * @return
     */
    public ResponseDTO<KaptchaVO> verificationCode() {
        KaptchaVO kaptchaVO = new KaptchaVO();
        String uuid = buildVerificationCodeRedisKey(UUID.randomUUID().toString());
        String kaptchaText = defaultKaptcha.createText();

        String base64Code = "";

        BufferedImage image = defaultKaptcha.createImage(kaptchaText);
        ByteArrayOutputStream outputStream = null;
        try {
            outputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", outputStream);
            base64Code = Base64.encodeBase64String(outputStream.toByteArray());
        } catch (IOException e) {
            log.error("verificationCode exception .{}", e);
        }finally {
            if(outputStream != null){
                try {
                    outputStream.close();
                } catch (Exception e) {
                    log.error("verificationCode outputStream close exception .{}", e);
                }
            }
        }
        kaptchaVO.setUuid(uuid);
        kaptchaVO.setCode("data:image/png;base64," + base64Code);

        //  验证码uuid和验证码数字缓存在redis中
//        redisValueOperations.set(uuid, kaptchaText, 60L, TimeUnit.SECONDS);
        return ResponseDTO.succData(kaptchaVO);
    }

    private String buildVerificationCodeRedisKey(String uuid) {
        return String.format(VERIFICATION_CODE_REDIS_PREFIX, uuid);
    }

}
