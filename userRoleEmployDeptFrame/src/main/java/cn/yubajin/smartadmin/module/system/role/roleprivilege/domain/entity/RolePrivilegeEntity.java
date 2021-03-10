package cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.entity;

import cn.yubajin.smartadmin.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 
 * [ 角色 权限关系 ]
 * 角色 * - * 权限
 *
 * @version 1.0
 * @since JDK1.8
 * @author yandanyang
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 */
@Data
@TableName("t_role_privilege")
public class RolePrivilegeEntity extends BaseEntity {

    /**
     * 角色 id
     */
    private Long roleId;

    /**
     * 功能权限 id
     */
    private String privilegeKey;


}
