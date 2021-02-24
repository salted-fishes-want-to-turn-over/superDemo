package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.Employee;
import com.example.entity.VO.EmployeeVO;

import java.util.List;

public interface EmployeeMapper extends BaseMapper<Employee> {

    //联表查询部门下的所有员工
    List<EmployeeVO> getEmployeeByDept(String deptName);
}
