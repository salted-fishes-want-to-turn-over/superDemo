package cn.yubajin.smartadmin.module.system.position.domain.entity;

import cn.yubajin.smartadmin.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 岗位关联关系
 * 员工 1 - * 岗位
 * @author zzr
 */
@Data
@TableName("t_position_relation")
public class PositionRelationEntity extends BaseEntity {

    /**
     * 岗位ID
     */
    private Long positionId;

    /**
     * 员工ID
     */
    private Long employeeId;

}
