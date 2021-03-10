package cn.yubajin.smartadmin.module.system.privilege.dao;

import cn.yubajin.smartadmin.module.system.privilege.domain.entity.PrivilegeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * 
 * [  ]
 * 
 * @version 1.0
 * @since JDK1.8
 * @author yandanyang
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 */
@Mapper
@Component
public interface PrivilegeDao extends BaseMapper<PrivilegeEntity> {

    /**
     * 查询所有权限
     * @return
     */
    List<PrivilegeEntity> selectAll();




}
