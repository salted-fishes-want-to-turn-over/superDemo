package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeAddDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeQueryDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.util.SmartRequestTokenUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * @author yubajin
 */
@RestController
@Api(tags = {SwaggerTagConst.Admin.MANAGER_USER})
@OperateLog
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @ApiOperation(value = "员工管理查询", notes = "员工管理查询 @author yubajin")
    @PostMapping("/employee/query")
    public ResponseDTO<PageResultDTO<EmployeeVO>> query(@RequestBody EmployeeQueryDTO employeeQueryDTO){
        return employeeService.selectEmployeeList(employeeQueryDTO);
    }

    @ApiOperation(value = "添加员工", notes = "添加员工 @author yubajin")
    @PostMapping("/employee/add")
    public ResponseDTO<String> addEmployee(@Valid @RequestBody EmployeeAddDTO emp){
//        RequestTokenBO requestUser = SmartRequestTokenUtil.getRequestUser();
//        return employeeService.addEmployee(emp, requestUser);
        return employeeService.addEmployee(emp);
    }
}
