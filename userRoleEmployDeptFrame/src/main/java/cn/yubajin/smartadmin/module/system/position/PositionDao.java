package cn.yubajin.smartadmin.module.system.position;

import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionQueryDTO;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationAddDTO;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationQueryDTO;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationResultDTO;
import cn.yubajin.smartadmin.module.system.position.domain.entity.PositionEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author zzr
 */
@Mapper
@Component
public interface PositionDao extends BaseMapper<PositionEntity> {

    /**
     * 查询岗位列表
     *
     * @param page
     * @param queryDTO
     * @return
     */
    List<PositionEntity> selectByPage(Page page, @Param("queryDTO") PositionQueryDTO queryDTO);

    /**
     * 查询岗位与人员关系
     *
     * @param positionRelationQueryDTO
     * @return
     */
    List<PositionRelationResultDTO> selectRelation(PositionRelationQueryDTO positionRelationQueryDTO);

    /**
     * 批量查询员工岗位信息 (如果员工信息不为空，查出 selectEmployeeList 员工信息对应的岗位信息)
     * @param employeeIdList
     * @return
     */
    List<PositionRelationResultDTO> selectEmployeesRelation(@Param("employeeIdList") List<Long> employeeIdList);

    /**
     * 批量添加岗位 人员 关联关系 (增加员工 employeeAdd 时，同时需要插入员工对应的岗位信息)
     *
     * @param positionRelationAddDTO
     * @return
     */
    Integer insertBatchRelation(@Param("batchDTO") PositionRelationAddDTO positionRelationAddDTO);

//    /**
//     * 删除指定人员的 岗位关联关系
//     *
//     * @param employeeId
//     * @return
//     */
//    Integer deleteRelationByEmployeeId(@Param("employeeId") Long employeeId);

}
