package com.example.entity.VO;


import cn.afterturn.easypoi.excel.annotation.Excel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class EmployeeDeptVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("员工表的id")
    @Excel(name = "员工ID",width= 20)
    private Long employeeId;

    @ApiModelProperty("员工表的姓名")
    @Excel(name = "员工姓名",width= 20)
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

    @ApiModelProperty("部门表的名称")
    @Excel(name = "员工部门名称",width= 20)
    private String  deptName;

    @ApiModelProperty("部门表的数据库")
    @Excel(name = "员工部门数据库",width= 20)
    private String  deptDbsource;
}
