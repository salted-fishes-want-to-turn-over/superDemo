package com.example.controller;


import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.example.common.controller.BaseController;
import com.example.common.utils.PageUtil;
import com.example.common.utils.R;
import com.example.entity.DTO.EmployeeDTO;
import com.example.entity.DTO.EmployeeDeptDTO;
import com.example.entity.Employee;
import com.example.entity.ExcelImport.EmployeeImport;
import com.example.entity.VO.EmployeeDeptVO;
import com.example.entity.VO.EmployeeVO;
import com.example.service.IEmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
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
public class EmployeeController extends BaseController {

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

    @ApiOperation(value = "全部导出成excel")
    @PostMapping("exportAll")
    public void exportAll(@RequestBody @Validated EmployeeDeptDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<EmployeeDeptVO> employeeDeptVOList = employeeService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("员工-部门表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, EmployeeDeptVO.class, employeeDeptVOList);
        downloadExcel("员工-部门信息", workbook, response);
    }

    @ApiOperation(value = "按模板表格导入成excel")
    @PostMapping("importAll")
    public R importAll(@RequestParam("file") MultipartFile file) throws Exception {
        String[] formats = {"xls","xlsx"};
        String suffixName = FilenameUtils.getExtension(file.getOriginalFilename());
        boolean fileIsValid = false;
        //文件格式判断
        for(String format: formats){
            if(StringUtils.equals(suffixName , format)){
                fileIsValid = true;
                break;
            }
        }
        if(!fileIsValid){
            return R.error("file format is not supported!");
        }
        ImportParams importParams = new ImportParams();
        //设置标题的行数，有标题时一定要有
        importParams.setTitleRows(1);
        //设置表头的行数
        importParams.setHeadRows(1);

        List<EmployeeImport> list = null;
        try {
            list = ExcelImportUtil.importExcel(
                    file.getInputStream(),
                    EmployeeImport.class, importParams);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("解析到的数据长度是：" + list.size());
        for (EmployeeImport employeeImport : list) {
            System.out.println("***********有标题有表头导入的数据是=" + employeeImport.toString());

        }
        employeeService.batchSave(list);

        return R.ok("成功导入" + list.size() + "条数据");
    }
}
