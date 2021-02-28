package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.common.utils.PageUtil;
import com.example.entity.DTO.EmployeeDTO;
import com.example.entity.DTO.EmployeeDeptDTO;
import com.example.entity.Employee;
import com.example.entity.ExcelImport.EmployeeImport;
import com.example.entity.VO.EmployeeDeptVO;
import com.example.entity.VO.EmployeeVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
public interface IEmployeeService extends IService<Employee> {
    /**
     * 联表查询部门下的所有员工
     * @param deptName
     * @return
     */
    public List<EmployeeVO> getEmployeesByDeptName(String deptName);

    /**
     * 分页查询相同地址员工表员工
     * @param employeeDTO
     * @return
     */
    public PageUtil<Employee> getEmployeeByPage(EmployeeDTO employeeDTO);

    /**
     * 查询全部导出对象
     * @param queryDTO
     * @return
     */
    public List<EmployeeDeptVO> queryAllExportData(EmployeeDeptDTO queryDTO);

    /**
     * 批量插入部门信息
     * @param employeeImportList
     * @return
     * @throws Exception
     */
    public int batchSave(List<EmployeeImport> employeeImportList) throws Exception;
}
