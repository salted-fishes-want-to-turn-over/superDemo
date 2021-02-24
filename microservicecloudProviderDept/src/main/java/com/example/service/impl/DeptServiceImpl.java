package com.example.service.impl;

import com.example.entity.DTO.DeptDTO;
import com.example.entity.Dept;
import com.example.mapper.DeptMapper;
import com.example.service.IDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
@Service
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

    @Resource
    private DeptMapper deptMapper;

    /**
     * 插入一条部门信息
     * @param deptDTO
     * @return
     */
    @Override
    public Integer saveOne(DeptDTO deptDTO) {
        Dept newDept = new Dept();
        BeanUtils.copyProperties(deptDTO, newDept);
        int insert = deptMapper.insert(newDept);
        return insert;
    }

    /**
     * 批量插入部门信息
     * @param deptDTOS
     * @return
     * @throws Exception
     */
    @Override
    public int batchSave(List<DeptDTO> deptDTOS) throws Exception{
        int count = deptMapper.insertBatch(deptDTOS);
        return count;
    }

    /**
     * 按照id查询部门信息
     * @param id
     * @return
     */
    @Override
    public Dept getDeptById(Long id) {
        Dept dept = new Dept();
        dept = deptMapper.getDeptById(id);
        return dept;
    }

    /**
     * 按照id修改部门信息
     * @param deptDTO
     * @return
     */
    @Override
    public Boolean updateDeptById(DeptDTO deptDTO){
        Dept updatedept = new Dept();
        BeanUtils.copyProperties(deptDTO, updatedept);

        return this.updateById(updatedept);
    }
}
