package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.constant.JudgeEnum;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeQueryDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.position.PositionDao;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationResultDTO;
import cn.yubajin.smartadmin.util.SmartPageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private PositionDao positionDao;

    /**
     * 查询员工列表,一个员工可对应多个岗位
     *
     * @param employeeQueryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<EmployeeVO>> selectEmployeeList(EmployeeQueryDTO employeeQueryDTO){
        Page pageParam = SmartPageUtil.convert2QueryPage(employeeQueryDTO);
        employeeQueryDTO.setIsDelete(JudgeEnum.NO.getValue());
        List<EmployeeDTO> employeeList = employeeDao.selectEmployeeList(pageParam, employeeQueryDTO);//分页查出员工信息

        List<Long> employeeIdList = employeeList.stream().map(EmployeeDTO::getId).collect(Collectors.toList());

        if (CollectionUtils.isNotEmpty(employeeIdList)) { // 如果员工信息不为空，查出员工信息对应的岗位信息
            List<PositionRelationResultDTO> positionRelationResultDTOList = positionDao.selectEmployeesRelation(employeeIdList);
            Map<Long, List<PositionRelationResultDTO>> employeePositionMap = new HashedMap(); //  ******用于存放 员工id及其对应的岗位信息******

            for (PositionRelationResultDTO positionRelationResultDTO : positionRelationResultDTOList) {
                List<PositionRelationResultDTO> relationResultDTOList = employeePositionMap.get(positionRelationResultDTO.getEmployeeId());
                //匹配对应的岗位, 岗位存在，则添加到employeeId对应Map中
                if (relationResultDTOList == null) { // 如果map中没有employeeId的key, 新建一个list，map的key为迭代的employeeId, value为employeeId对应的positionRelation实体
                    relationResultDTOList = new ArrayList<>();
                    employeePositionMap.put(positionRelationResultDTO.getEmployeeId(), relationResultDTOList);
                }
                relationResultDTOList.add(positionRelationResultDTO); // 注意 new 完list 是先put list到map的value里面，在 add positionRelation到list里面。
            }

            for (EmployeeDTO employeeDTO : employeeList) {
                List<PositionRelationResultDTO> relationResultDTOList = employeePositionMap.get(employeeDTO.getId());
                if (relationResultDTOList != null) {
                    employeeDTO.setPositionRelationList(relationResultDTOList);
                    employeeDTO.setPositionName(relationResultDTOList.stream().map(PositionRelationResultDTO::getPositionName).collect(Collectors.joining(",")));
                }
            }
        }
        return ResponseDTO.succData(SmartPageUtil.convert2PageResult(pageParam, employeeList, EmployeeVO.class));
    }
}
