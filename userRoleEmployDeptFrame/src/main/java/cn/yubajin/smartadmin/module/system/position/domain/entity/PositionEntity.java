package cn.yubajin.smartadmin.module.system.position.domain.entity;

import cn.yubajin.smartadmin.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 岗位
 *
 * @author zzr
 */
@Data
@TableName("t_position")
public class PositionEntity extends BaseEntity {

    /**
     * 岗位名称
     */
    private String positionName;

    /**
     * 岗位描述
     */
    private String remark;

}
