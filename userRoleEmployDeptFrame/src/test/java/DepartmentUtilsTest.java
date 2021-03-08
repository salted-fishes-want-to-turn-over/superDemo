import cn.yubajin.smartadmin.UserRoleEmployDeptFrameApplication;
import cn.yubajin.smartadmin.constant.CommonConst;
import cn.yubajin.smartadmin.module.system.department.domain.vo.DepartmentVO;
import cn.yubajin.smartadmin.module.system.employee.EmployeeDao;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeLoginFormDTO;
import cn.yubajin.smartadmin.module.system.login.LoginTokenService;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.module.system.position.PositionDao;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationAddDTO;
import cn.yubajin.smartadmin.util.SmartDigestUtil;
import cn.yubajin.smartadmin.util.SmartRequestTokenUtil;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = UserRoleEmployDeptFrameApplication.class)
public class DepartmentUtilsTest {

    private static final String RESET_PASSWORD = "123456";

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private PositionDao positionDao;

    @Autowired
    private LoginTokenService loginTokenService;

    @Test
    public void testStream(){
        List<DepartmentVO> departmentVOList = new ArrayList();

        Map<Long, DepartmentVO> collect = departmentVOList.stream().collect(Collectors.toMap(DepartmentVO::getId, Function.identity()));

        List<DepartmentVO> list = departmentVOList.stream().filter(e -> e.getParentId() == null || e.getParentId() == 0).collect(Collectors.toList());

    }

    @Test
    public void StringFormate(){

        String result = String.format(CommonConst.Password.SALT_FORMAT, RESET_PASSWORD);
        System.out.println(result);
    }

    @Test
    public void insertBatchRelation(){
        PositionRelationAddDTO positionRelAddDTO = new PositionRelationAddDTO();
        positionRelAddDTO.setEmployeeId(3L);
        ArrayList<Long> list = new ArrayList<>();
        list.add(11L);
        list.add(12L);
        list.add(13L);
        positionRelAddDTO.setPositionIdList(list);
        positionDao.insertBatchRelation(positionRelAddDTO);
    }

    @Test
    public void loginTokenServiceGenToken(){
        EmployeeLoginFormDTO loginForm = new EmployeeLoginFormDTO();
        loginForm.setLoginName("tiantian");
        loginForm.setLoginPwd("123456");

        String loginPwd = SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, loginForm.getLoginPwd());

        EmployeeDTO employeeDTO = employeeDao.login(loginForm.getLoginName(), loginPwd);

        //jwt token赋值
        String compactJws = loginTokenService.generateToken(employeeDTO);
        System.out.println("---------------------令牌compactJws为: " + compactJws);
    }

    @Test
    public void getRequestUserFromToken(){
        //在拦截器既Interceptor中SmartRequestTokenUtil.setUser();故可从token中查出user
        RequestTokenBO requestUser = SmartRequestTokenUtil.getRequestUser();
        String msg = JSONObject.toJSONString(requestUser);
        System.out.println("---------------------msg:" + msg);
    }
}
