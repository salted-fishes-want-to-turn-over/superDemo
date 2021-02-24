package com.example.service;

import com.example.entity.DTO.DeptDTO;
import com.example.entity.Dept;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
public interface IDeptService extends IService<Dept> {

    /**
     * 插入一条部门信息
     * @param deptDTO
     * @return
     */
    Integer saveOne(DeptDTO deptDTO);


    /**
     * 批量插入部门信息
     * @param deptDTOS
     * @return
     * @throws Exception
     */
    int batchSave(List<DeptDTO> deptDTOS) throws Exception;

    /**
     * 按照id查询部门信息
     * @param id
     * @return
     */
    Dept getDeptById(Long id);

    /**
     * 按照id修改部门信息
     * @param deptDTO
     * @return
     */
    Boolean updateDeptById(DeptDTO deptDTO);
}
