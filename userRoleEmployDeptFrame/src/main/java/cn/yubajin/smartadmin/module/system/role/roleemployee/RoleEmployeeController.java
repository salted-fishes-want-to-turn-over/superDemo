package cn.yubajin.smartadmin.module.system.role.roleemployee;

import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleBatchDTO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleQueryDTO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleSelectedVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Api(tags = SwaggerTagConst.Admin.MANAGER_ROLE_USER)
@OperateLog
@RestController
public class RoleEmployeeController {

    @Autowired
    private RoleEmployeeService roleEmployeeService;

    @ApiOperation(value = "根据角色 - 获取员工列表", notes = "根据角色 - 获取员工列表(分页)")
    @PostMapping("role/listEmployee")
    public ResponseDTO<PageResultDTO<EmployeeVO>> listEmployeeByRoleName(@RequestBody @Valid RoleQueryDTO queryDTO){
        return roleEmployeeService.listEmployeeByRoleName(queryDTO);
    }

    @ApiOperation(value = "根据角色id 获取所有员工列表(不分页)", notes = "根据角色id 获取所有员工列表(不分页)")
    @GetMapping("role/listAllEmployee/{roleId}")
    public ResponseDTO<List<EmployeeVO>> listAllEmployeeByRoleId(@PathVariable Long roleId){
        return roleEmployeeService.listAllEmployeeByRoleId(roleId);
    }

    @ApiOperation(value = "从角色成员列表中移除员工和角色关系", notes = "从角色成员列表中移除员工和角色关系")
    @ApiImplicitParams({@ApiImplicitParam(name = "employeeId", value = "员工id", paramType = "query", required = true), @ApiImplicitParam(name = "roleId", value = "角色id", paramType = "query",
            required = true)})
    @GetMapping("/role/removeEmployee")
    public ResponseDTO<String> removeEmployee(Long employeeId, Long roleId) {
        return roleEmployeeService.removeEmployeeRole(employeeId, roleId);
    }

    @ApiOperation(value = "从某个角色下批量移除员工", notes = "批量删除某个角色下的某批用户的关联关系")
    @PostMapping("/role/removeEmployeeList")
    public ResponseDTO<String> removeEmployeeList(@Valid @RequestBody RoleBatchDTO removeDTO) {
        return roleEmployeeService.batchRemoveEmployeeRole(removeDTO);
    }

    @ApiOperation(value = "角色成员列表中批量添加员工", notes = "角色成员列表中批量添加员工")
    @PostMapping("/role/addEmployeeList")
    public ResponseDTO<String> addEmployeeList(@Valid @RequestBody RoleBatchDTO addDTO) {
        return roleEmployeeService.batchAddEmployeeRole(addDTO);
    }

    @ApiOperation(value = "通过员工id获取所有角色以及员工具有的角色", notes = "通过员工id获取所有角色以及员工具有的角色")
    @GetMapping("/role/getRoles/{employeeId}")
    @ApiImplicitParams({@ApiImplicitParam(name = "employeeId", value = "员工id", paramType = "path", required = true)})
    public ResponseDTO<List<RoleSelectedVO>> getRoleByEmployeeId(@PathVariable Long employeeId) {
        return roleEmployeeService.getRolesByEmployeeId(employeeId);
    }

}
