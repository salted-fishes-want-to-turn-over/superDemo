package com.example.entity.VO;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class EmployeeVO implements Serializable {

    private static final long serialVersionUID = 1L;

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
}
