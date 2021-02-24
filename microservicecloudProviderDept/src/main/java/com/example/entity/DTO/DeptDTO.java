package com.example.entity.DTO;

import com.example.common.utils.validateUtils.Delete;
import com.example.common.utils.validateUtils.Update;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@ApiModel(value="", description="部门表")
public class DeptDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 部门编号,主键，设置自增类型
     */
    @ApiModelProperty(notes = "部门编号，修改、删除时必填")
    @NotNull(message = "id不能为空", groups = {Update.class, Delete.class})
    private Long deptNo;

    @ApiModelProperty(notes = "部门名称")
    private String deptName;

    @ApiModelProperty(notes = "部门数据库")
    private String deptDbsource;

    @ApiModelProperty(example = "1", position = 99, notes = "（页数）分页时必填")
    private Integer page;
    @ApiModelProperty(example = "20", position = 100, notes = "（页长）分页时必填")
    private Integer limit;

    public Integer getPage() {
        return page == null || page <= 0 ? 1 : page;
    }

    public Integer getLimit() {
        return limit == null || page <= 0  ? 100 : limit;
    }


}