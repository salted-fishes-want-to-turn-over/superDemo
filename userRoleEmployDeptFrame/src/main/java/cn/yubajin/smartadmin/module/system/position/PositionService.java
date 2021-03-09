package cn.yubajin.smartadmin.module.system.position;

import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.module.system.position.domain.dto.*;
import cn.yubajin.smartadmin.module.system.position.domain.entity.PositionEntity;
import cn.yubajin.smartadmin.util.SmartBeanUtil;
import cn.yubajin.smartadmin.util.SmartPageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


/**
 * @author zzr
 */
@Service
public class PositionService {

    @Autowired
    private PositionDao positionDao;


    /**
     * 添加岗位关联关系
     *
     * @param positionRelAddDTO
     * @return
     */
    public ResponseDTO<String> addPositionRelation(PositionRelationAddDTO positionRelAddDTO) {
        positionDao.insertBatchRelation(positionRelAddDTO);
        return ResponseDTO.succ();
    }


    /**
     * 查询岗位
     *
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<PositionResultVO>> queryPositionByPage(PositionQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        List<PositionEntity> entityList = positionDao.selectByPage(page, queryDTO);
        page.setRecords(entityList.stream().map(e -> SmartBeanUtil.copy(e, PositionResultVO.class)).collect(Collectors.toList()));
        PageResultDTO<PositionResultVO> pageResultDTO = SmartPageUtil.convert2PageResult(page);
        return ResponseDTO.succData(pageResultDTO);
    }


    /**
     * 新增岗位
     *
     * @param addDTO
     * @return
     */
    public ResponseDTO<String> addPosition(PositionAddDTO addDTO) {
        PositionEntity positionEntity = SmartBeanUtil.copy(addDTO, PositionEntity.class);
        positionDao.insert(positionEntity);
        return ResponseDTO.succ();
    }

    /**
     * 修改岗位
     *
     * @param updateDTO
     * @return
     */
    public ResponseDTO<String> updatePosition(PositionUpdateDTO updateDTO) {
        PositionEntity positionEntity = SmartBeanUtil.copy(updateDTO, PositionEntity.class);
        int i = positionDao.updateById(positionEntity);
        if(i <= 0)
            return ResponseDTO.wrap(PositionResponseCodeConst.POSITION_NO_FOUND);
        return ResponseDTO.succ();
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    public ResponseDTO<PositionResultVO> queryPositionById(Long id) {
        return ResponseDTO.succData(SmartBeanUtil.copy(positionDao.selectById(id), PositionResultVO.class));
    }

    /**
     * 删除岗位
     */
    public ResponseDTO<String> removePosition(Long id) {
        //查询是否还有人关联该岗位
        PositionRelationQueryDTO positionRelationQueryDTO = new PositionRelationQueryDTO();
        positionRelationQueryDTO.setPositionId(id);
        List<PositionRelationResultDTO> dtoList = positionDao.selectRelation(positionRelationQueryDTO);
        if (CollectionUtils.isNotEmpty(dtoList)) {
            return ResponseDTO.wrap(PositionResponseCodeConst.REMOVE_DEFINE);
        }
        positionDao.deleteById(id);
        return ResponseDTO.succ();
    }


    /**
     * 删除指定用户的岗位关联关系
     *
     * @param employeeId
     * @return
     */
    public ResponseDTO<String> removePositionRelation(Long employeeId) {
        positionDao.deleteRelationByEmployeeId(employeeId);
        return ResponseDTO.succ();
    }
}
