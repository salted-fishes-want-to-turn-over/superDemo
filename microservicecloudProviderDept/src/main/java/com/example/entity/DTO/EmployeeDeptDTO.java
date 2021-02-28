package com.example.entity.DTO;


import com.example.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class EmployeeDeptDTO extends PageParamDTO {


    @ApiModelProperty("员工表的id")
    private Long employeeId;

    @ApiModelProperty("员工表的姓名")
    private String employeeName;

    @ApiModelProperty("员工表的电话")
    private String employeePhone;

    @ApiModelProperty("员工表的地址")
    private String employeeAddress;

    @ApiModelProperty("部门表的id")
    private Long deptId;

    @ApiModelProperty("部门表的名称")
    private String  deptName;

    @ApiModelProperty("部门表的名称")
    private String  deptDbsource;
}

