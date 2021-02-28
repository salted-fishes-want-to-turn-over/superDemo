package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.DTO.DeptDTO;
import com.example.entity.DTO.EmployeeDTO;
import com.example.entity.DTO.EmployeeDeptDTO;
import com.example.entity.Employee;
import com.example.entity.ExcelImport.EmployeeImport;
import com.example.entity.VO.EmployeeDeptVO;
import com.example.entity.VO.EmployeeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper extends BaseMapper<Employee> {

    //联表查询部门下的所有员工
    List<EmployeeVO> getEmployeeByDept(String deptName);

    //分页查询员工表员工
    List<Employee> getEmployeeByPage(Page page, @Param("employee") EmployeeDTO employeeDTO);

    /**
     * 查询所有导出数据
     * @param queryDTO
     * @return
     */
    List<EmployeeDeptVO> queryAllExportData(@Param("EmployeeDeptDTO") EmployeeDeptDTO queryDTO);

    /**
     * 批量添加部门
     *
     * @param employeeImportList 批量添加部门列表
     * @return 插入记录数
     */
    int insertBatch(@Param("list") List<EmployeeImport> employeeImportList);
}
