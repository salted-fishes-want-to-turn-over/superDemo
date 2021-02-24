package com.example.controller;


import com.example.common.utils.R;
import com.example.entity.VO.EmployeeVO;
import com.example.service.IEmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

}
