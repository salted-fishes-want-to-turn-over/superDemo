package com.example.mapper;

import com.example.entity.DTO.DeptDTO;
import com.example.entity.Dept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
public interface DeptMapper extends BaseMapper<Dept> {

//
//    /***
//     * 批量添加多条记录
//     * @param depts
//     * @return
//     * @throws Exception
//     */
//    int batchSave(List<Dept> depts) throws Exception;
//

  /**
  * 批量删除部门
  *
  * @param ids 需要删除的数据ID
  * @return 结果
  */
//    int deleteDeptByIds(String ids);

    /***
     * 按照id查询部门
     * @param deptId
     * @return
     */
    Dept getDeptById(@Param("deptId")Long deptId);


    /**
     * 批量添加部门
     *
     * @param deptDTOS 批量添加部门列表
     * @return 插入记录数
     */
    int insertBatch(@Param("list") List<DeptDTO> deptDTOS);


}
