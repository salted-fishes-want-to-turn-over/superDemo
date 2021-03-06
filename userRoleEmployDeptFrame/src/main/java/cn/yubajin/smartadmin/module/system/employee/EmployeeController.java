package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.anno.OperateLog;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.SwaggerTagConst;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeQueryDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController

@Api(tags = {SwaggerTagConst.Admin.MANAGER_USER})
@OperateLog
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @PostMapping("/employee/query")
    @ApiOperation(value = "员工管理查询", notes = "员工管理查询 @author lidoudou")
    public ResponseDTO<PageResultDTO<EmployeeVO>> query(@RequestBody EmployeeQueryDTO employeeQueryDTO){
        return employeeService.selectEmployeeList(employeeQueryDTO);
    }
}
