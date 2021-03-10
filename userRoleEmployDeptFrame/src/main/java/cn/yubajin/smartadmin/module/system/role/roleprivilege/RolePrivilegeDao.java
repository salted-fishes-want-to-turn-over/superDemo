package cn.yubajin.smartadmin.module.system.role.roleprivilege;

import cn.yubajin.smartadmin.module.system.privilege.domain.entity.PrivilegeEntity;
import cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.entity.RolePrivilegeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * [  ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2018 1024lab.netInc. All rights reserved.
 * @date 2019/3/28 0028 下午 12:23
 * @since JDK1.8
 */
@Mapper
@Component
public interface RolePrivilegeDao extends BaseMapper<RolePrivilegeEntity> {

    /**
     * 根据角色id删除
     * @param roleId
     */
    void deleteByRoleId(@Param("roleId")Long roleId);

    /**
     * 批量添加
     * @param rolePrivilegeList
     */
    void batchInsert(List<RolePrivilegeEntity> rolePrivilegeList);

    /**
     * 查询某个角色的权限
     * @param roleId
     * @return
     */
    List<PrivilegeEntity> listByRoleId(@Param("roleId")Long roleId);
}
