package com.example.controller;


import com.example.common.utils.PageUtil;
import com.example.common.utils.R;
import com.example.entity.DTO.EmployeeDTO;
import com.example.entity.Employee;
import com.example.entity.VO.EmployeeVO;
import com.example.service.IEmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
@RestController
@RequestMapping("/employee")
@Api(value = "Empolyee操作Api", tags = "Empolyee操作Api")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;
    @GetMapping("getEmployeeDept")
    @ApiOperation("根据部门名称查询员工信息")
    public R getEmployeeByDeptName(@RequestParam("deptName") String deptName){
        List<EmployeeVO> employeeVOS = employeeService.getEmployeesByDeptName(deptName);
        if (employeeVOS!=null){
            return R.ok(0,"操作成功",employeeVOS);
        }
        return R.error("操作失败");
    }

    /**
     * 分页查询相同地址员工表员工
     * @param employeeDTO
     * @return
     */
    @ApiOperation(value = "分页条件查询员工列表，可传员工地址，查看同一个地方employeeAddress的员工")
    @PostMapping("pageQuery")
    public R pageQuery(@ApiParam(name = "员工列表", value = "传入json格式", required = true)
                       @RequestBody EmployeeDTO employeeDTO){
        PageUtil<Employee> voPageUtil = employeeService.getEmployeeByPage(employeeDTO);
        return R.ok().put("data",voPageUtil);
    }

}
