package cn.yubajin.smartadmin.module.system.employee.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class EmployeeUpdateDTO extends EmployeeBaseDTO{

    @ApiModelProperty("员工id")
    @NotNull(message = "员工id不能为空")
    private Long id;

    @ApiModelProperty("登录密码")
    private String loginPwd;

    @ApiModelProperty("岗位id集合")
    private List<Long> positionIdList;
}
