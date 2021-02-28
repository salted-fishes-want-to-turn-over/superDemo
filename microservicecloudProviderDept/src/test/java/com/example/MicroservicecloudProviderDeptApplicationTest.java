package com.example;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.example.MicroservicecloudProviderDeptApplication;
import com.example.entity.DTO.EmployeeDeptDTO;
import com.example.entity.Dept;
import com.example.entity.VO.EmployeeDeptVO;
import com.example.mapper.DeptMapper;
import com.example.service.IDeptService;
import com.example.service.IEmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@SpringBootTest()
public class MicroservicecloudProviderDeptApplicationTest {
    /**
     * Spring Boot 默认已经配置好了数据源，程序员可以直接 DI 注入然后使用即可
     */

    @Autowired
    private IDeptService deptService;
    @Autowired
    private IEmployeeService employeeService;

    @Test
    public void contextLoads(){
        Dept deptList = deptService.getDeptById(1L);
        System.out.println(deptList);
//        deptList.forEach(System.out::println);

    }

    @Test
    public void export(){
        EmployeeDeptDTO employeeDeptDTO = new EmployeeDeptDTO();//查询数据
        List<EmployeeDeptVO> employeeDeptVOList = employeeService.queryAllExportData(employeeDeptDTO);
        //导出操作
        ExportParams ex = new ExportParams("员工-部门表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, EmployeeDeptVO.class, employeeDeptVOList);
        HttpServletResponse response = null;
        downloadExcel("员工-部门信息", workbook, response);
    }

    public void downloadExcel(String fileName, Workbook workbook, HttpServletResponse response) {
        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.error("", e);
        }
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
        try {
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (IOException e) {
            log.error("", e);
        }
    }


}