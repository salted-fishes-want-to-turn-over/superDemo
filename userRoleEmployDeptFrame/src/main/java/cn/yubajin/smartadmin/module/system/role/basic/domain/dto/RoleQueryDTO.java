package cn.yubajin.smartadmin.module.system.role.basic.domain.dto;

import cn.yubajin.smartadmin.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RoleQueryDTO extends PageParamDTO {

    @ApiModelProperty("角色名称")
    private String roleName;

    @ApiModelProperty("角色id")
    private String roleId;
}
