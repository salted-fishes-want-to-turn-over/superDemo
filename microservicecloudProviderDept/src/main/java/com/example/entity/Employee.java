package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Employee对象", description="")
@TableName("employee")
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "employee_id", type = IdType.AUTO)
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


}
