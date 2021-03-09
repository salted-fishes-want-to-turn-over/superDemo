package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.*;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.util.SmartRequestTokenUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

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

    @ApiOperation(value = "通过部门id获取当前部门的人员&没有部门的人", notes = "@author yandanyang")
    @GetMapping("/employee/listEmployeeByDeptId/{deptId}")
    public ResponseDTO<List<EmployeeVO>> listEmployeeByDeptId(@PathVariable Long deptId) {
        return employeeService.getEmployeeByDeptId(deptId);
    }

    @ApiOperation(value = "添加员工", notes = "添加员工 @author yubajin")
    @PostMapping("/employee/add")
    public ResponseDTO<String> addEmployee(@Valid @RequestBody EmployeeAddDTO emp){
        RequestTokenBO requestUser = SmartRequestTokenUtil.getRequestUser();
        return employeeService.addEmployee(emp, requestUser);
    }

    @ApiModelProperty(value = "更新员工", notes = "更新员工 @author yubajin")
    @PostMapping("/employee/update")
    public ResponseDTO<String> updateEmployee(@Valid @RequestBody EmployeeUpdateDTO employeeUpdateDTO){
        return employeeService.updateEmployee(employeeUpdateDTO);
    }

    @ApiOperation(value = "修改密码", notes = "@author yandanyang")
    @PostMapping("/employee/updatePwd")
    public ResponseDTO<String> updatePwd(@Valid @RequestBody EmployeeUpdatePwdDTO updatePwdDTO) {
        RequestTokenBO requestToken = SmartRequestTokenUtil.getRequestUser();
        return employeeService.updatePwd(updatePwdDTO, requestToken);
    }


    @ApiOperation(value = "员工重置密码", notes = "@author lizongliang")
    @GetMapping("/employee/resetPasswd/{employeeId}")
    public ResponseDTO resetPasswd(@PathVariable("employeeId") Integer employeeId) {
        return employeeService.resetPasswd(employeeId);
    }



    @ApiModelProperty(value = "删除员工", notes = "删除员工 @author yubajin")
    @PostMapping("/employee/delete/{employeeId}")
    public ResponseDTO<String> deleteEmployeeById(@PathVariable("employeeId") Long employeeId){
        return employeeService.deleteEmployeeById(employeeId);
    }


    @ApiOperation(value = "禁用单个员工", notes = "@author yandanyang")
    @GetMapping("/employee/updateStatus/{employeeId}/{status}")
    public ResponseDTO<String> updateStatus(@PathVariable("employeeId") Long employeeId, @PathVariable("status") Integer status) {
        return employeeService.updateStatus(employeeId, status);
    }

    @ApiOperation(value = "批量禁用", notes = "@author yandanyang")
    @PostMapping("/employee/batchUpdateStatus")
    public ResponseDTO<String> batchUpdateStatus(@Valid @RequestBody EmployeeBatchUpdateStatusDTO batchUpdateStatusDTO) {
        return employeeService.batchUpdateStatus(batchUpdateStatusDTO);
    }

}
