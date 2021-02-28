package com.example.entity.ExcelImport;


import cn.afterturn.easypoi.excel.annotation.Excel;
import com.example.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class EmployeeImport implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("员工表的id")
    private Long employeeId;

    @ApiModelProperty("员工表的姓名")
    @Excel(name = "员工姓名",width= 20)
    @NotNull(message = "员工姓名不能为空")
    private String employeeName;

    @ApiModelProperty("员工表的电话")
    @Excel(name = "员工电话",width= 20)
    private String employeePhone;

    @ApiModelProperty("员工表的地址")
    @Excel(name = "员工地址",width= 20)
    private String employeeAddress;

    @ApiModelProperty("部门表的id")
    @Excel(name = "员工部门ID",width= 20)
    private Long deptId;

}

