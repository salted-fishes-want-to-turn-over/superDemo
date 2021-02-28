package com.example.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.common.utils.PageUtil;
import com.example.common.utils.SmartBeanUtil;
import com.example.entity.DTO.DeptDTO;
import com.example.entity.DTO.EmployeeDTO;
import com.example.entity.DTO.EmployeeDeptDTO;
import com.example.entity.Employee;
import com.example.entity.ExcelImport.EmployeeImport;
import com.example.entity.VO.EmployeeDeptVO;
import com.example.entity.VO.EmployeeVO;
import com.example.mapper.EmployeeMapper;
import com.example.service.IEmployeeService;
import com.fasterxml.jackson.databind.util.BeanUtil;
import lombok.var;
import org.springframework.beans.BeanUtils;
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

    /**
     * 分页查询相同地址员工表员工
     * @param employeeDTO
     * @return
     */
    @Override
    public PageUtil<Employee> getEmployeeByPage(EmployeeDTO employeeDTO) {
        Integer page = employeeDTO.getPage();// pageNo 页码
        Integer limit = employeeDTO.getLimit();// pageSize 页长，一页多少数据

        EmployeeDTO newEmployeeDTO = new EmployeeDTO();

//        Page var = new Page(page,limit);
        Page var = new Page();
        var.setCurrent(page);
        var.setSize(limit);

        if (employeeDTO.getEmployeeAddress()!=null){
            String s = employeeDTO.getEmployeeAddress().replaceAll("%", "/%").replaceAll("_", "/_");
            newEmployeeDTO.setEmployeeAddress(s);

        }
        List<Employee> employees= this.baseMapper.getEmployeeByPage(var ,newEmployeeDTO);

//        var.setRecords(employees);

        System.out.println("------------------------------------");
        System.out.println("总条数 -------------> " + var.getTotal());
        System.out.println("当前每页显示数 -------------> " + (int)var.getSize());
        System.out.println("当前页数 -------------> " + (int)var.getCurrent());
        System.out.println("------------------------------------");
        return new PageUtil(employees,var.getTotal(),(int)var.getSize(),(int)var.getCurrent());
    }

    /**
     * 查询全部导出对象
     *
     * @param queryDTO
     * @return
     */
    @Override
    public List<EmployeeDeptVO> queryAllExportData(EmployeeDeptDTO queryDTO) {
        EmployeeDeptDTO newEmployeeDeptDTO = new EmployeeDeptDTO();
        if(queryDTO.getEmployeeAddress()!=null || queryDTO.getEmployeeAddress()!=" "){
            newEmployeeDeptDTO.setEmployeeAddress(queryDTO.getEmployeeAddress());
        }

        return employeeMapper.queryAllExportData(newEmployeeDeptDTO);
    }

    /**
     * 批量插入部门信息
     * @param employeeImportList
     * @return
     * @throws Exception
     */
    @Override
    public int batchSave(List<EmployeeImport> employeeImportList) throws Exception{
        int count = employeeMapper.insertBatch(employeeImportList);
        return count;
    }
}
