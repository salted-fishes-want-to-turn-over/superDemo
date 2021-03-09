package cn.yubajin.smartadmin.module.system.role.roleemployee;

import cn.yubajin.smartadmin.module.system.role.roleemployee.domain.RoleEmployeeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
 * @date 2019/3/27 0027 下午 13:00
 * @since JDK1.8
 */
@Mapper
@Component
public interface RoleEmployeeDao extends BaseMapper<RoleEmployeeEntity> {


    /**
     * 删除某个角色的所有关系
     * @param roleId
     */
    void deleteByRoleId(@Param("roleId")Long roleId);

}
