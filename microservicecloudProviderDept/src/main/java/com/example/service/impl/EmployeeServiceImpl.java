package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Employee;
import com.example.entity.VO.EmployeeVO;
import com.example.mapper.EmployeeMapper;
import com.example.service.IEmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements IEmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    /**
     * 联表查询部门下的所有员工
     * @param deptName
     * @return
     */
    @Override
    public List<EmployeeVO> getEmployeesByDeptName(String deptName) {
        return employeeMapper.getEmployeeByDept(deptName);
    }

}
