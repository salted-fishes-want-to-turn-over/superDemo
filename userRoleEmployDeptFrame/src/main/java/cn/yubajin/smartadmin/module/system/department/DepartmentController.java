package cn.yubajin.smartadmin.module.system.department;

import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.department.domain.dto.DepartmentCreateDTO;
import cn.yubajin.smartadmin.module.system.department.domain.dto.DepartmentUpdateDTO;
import cn.yubajin.smartadmin.module.system.department.domain.vo.DepartmentVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 部门管理路由器
 *
 * @author listen
 * @date 2017/12/19 14:29
 */
@Api(tags = {SwaggerTagConst.Admin.MANAGER_DEPARTMENT})
@OperateLog
@RestController
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @ApiOperation(value = "查询部门树形列表", notes = "查询部门列表")
    @GetMapping("/department/list")
    public ResponseDTO<List<DepartmentVO>> listDepartment() {
        return departmentService.listDepartment();
    }

    @ApiOperation(value = "查询部门及员工列表", notes = "查询部门及员工列表")
    @GetMapping("/department/listEmployee")
    public ResponseDTO<List<DepartmentVO>> listDepartmentEmployee() {
        return departmentService.listAllDepartmentEmployee(null);
    }

    @ApiOperation(value = "根据部门名称查询部门及员工列表", notes = "根据部门名称查询部门及员工列表")
    @GetMapping("/department/listEmployeeByDepartmentName")
    public ResponseDTO<List<DepartmentVO>> listDepartmentEmployee(@RequestParam("departmentName") String departmentName) {
        return departmentService.listAllDepartmentEmployee(departmentName);
    }

    @ApiOperation(value = "添加部门", notes = "添加部门")
    @PostMapping("/department/add")
    public ResponseDTO<String> addDepartment(@Valid @RequestBody DepartmentCreateDTO departmentCreateDTO) {
        return departmentService.addDepartment(departmentCreateDTO);
    }

    @ApiOperation(value = "更新部门信息", notes = "更新部门信息")
    @PostMapping("/department/update")
    public ResponseDTO<String> updateDepartment(@Valid @RequestBody DepartmentUpdateDTO departmentUpdateDTO) {
        return departmentService.updateDepartment(departmentUpdateDTO);
    }

    @ApiOperation(value = "删除部门", notes = "删除部门")
    @PostMapping("/department/delete/{deptId}")
    public ResponseDTO<String> delDepartment(@PathVariable Long deptId) {
        return departmentService.delDepartment(deptId);
    }

    @ApiOperation(value = "获取部门信息", notes = "获取部门")
    @GetMapping("/department/query/{deptId}")
    public ResponseDTO<DepartmentVO> getDepartment(@PathVariable Long deptId) {
        return departmentService.getDepartmentById(deptId);
    }

    @ApiOperation(value = "查询部门列表", notes = "查询部门列表")
    @GetMapping("/department/listAll")
    public ResponseDTO<List<DepartmentVO>> listAll() {
        return departmentService.listAll();
    }


}
