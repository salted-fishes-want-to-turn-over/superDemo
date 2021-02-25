package com.example.entity.DTO;

import com.example.common.utils.validateUtils.Delete;
import com.example.common.utils.validateUtils.Update;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
@ApiModel(value="", description="员工表")
public class EmployeeDTO {

    private static final long serialVersionUID = 1L;

    /**
     * 部门编号,主键，设置自增类型
     */
    @ApiModelProperty(notes = "员工表的id，修改、删除时必填")
    @NotNull(message = "id不能为空", groups = {Update.class, Delete.class})
    private Long employeeId;

    @ApiModelProperty("员工表的姓名")
    private String employeeName;

    @ApiModelProperty("员工表的电话")
    private String employeePhone;

    @ApiModelProperty("员工表的地址")
    private String employeeAddress;

    @ApiModelProperty("部门表的id")
    private Long deptId;


    @ApiModelProperty(example = "1", position = 99, notes = "（页数）分页时必填")//pageNo
    private Integer page;
    @ApiModelProperty(example = "20", position = 100, notes = "（页长）分页时必填")//pageSize
    private Integer limit;

    public Integer getPage() {
        return page == null || page <= 0 ? 1 : page;
    }

    // 一页先设置为10条数据
    public Integer getLimit() {
        return limit == null || page <= 0  ? 100 : limit;
    }

}
