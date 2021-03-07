package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.constant.JudgeEnum;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.CommonConst;
import cn.yubajin.smartadmin.module.system.department.DepartmentDao;
import cn.yubajin.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeResponseCodeConst;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeStatusEnum;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeAddDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeQueryDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.entity.EmployeeEntity;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.login.domain.RequestTokenBO;
import cn.yubajin.smartadmin.module.system.position.PositionDao;
import cn.yubajin.smartadmin.module.system.position.PositionService;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationAddDTO;
import cn.yubajin.smartadmin.module.system.position.domain.dto.PositionRelationResultDTO;
import cn.yubajin.smartadmin.util.SmartBeanUtil;
import cn.yubajin.smartadmin.util.SmartDigestUtil;
import cn.yubajin.smartadmin.util.SmartPageUtil;
import cn.yubajin.smartadmin.util.SmartVerificationUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * @author yubajin
 */
@Service
public class EmployeeService {

    private static final String RESET_PASSWORD = "123456";

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private PositionDao positionDao;

    @Autowired
    private PositionService positionService;

    /**
     * 查询员工列表,一个员工可对应多个岗位
     *
     * @param employeeQueryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<EmployeeVO>> selectEmployeeList(EmployeeQueryDTO employeeQueryDTO){
        Page pageParam = SmartPageUtil.convert2QueryPage(employeeQueryDTO);
        employeeQueryDTO.setIsDelete(JudgeEnum.NO.getValue());
        //分页查出员工信息
        List<EmployeeDTO> employeeList = employeeDao.selectEmployeeList(pageParam, employeeQueryDTO);

        List<Long> employeeIdList = employeeList.stream().map(EmployeeDTO::getId).collect(Collectors.toList());

        // 如果员工信息不为空，查出员工信息对应的岗位信息
        if (CollectionUtils.isNotEmpty(employeeIdList)) {
            List<PositionRelationResultDTO> positionRelationResultDTOList = positionDao.selectEmployeesRelation(employeeIdList);
            ///////////////////////////////用于存放 员工id及其对应的岗位信息///////////////////////
            Map<Long, List<PositionRelationResultDTO>> employeePositionMap = new HashedMap();

            for (PositionRelationResultDTO positionRelationResultDTO : positionRelationResultDTOList) {
                List<PositionRelationResultDTO> relationResultDTOList = employeePositionMap.get(positionRelationResultDTO.getEmployeeId());
                //匹配对应的岗位, 岗位存在，则添加到employeeId对应Map中
                if (relationResultDTOList == null) {
                    relationResultDTOList = new ArrayList<>();
                    employeePositionMap.put(positionRelationResultDTO.getEmployeeId(), relationResultDTOList);
                }
                // 注意 new 完list 是先put list到map的value里面，在 add positionRelation到list里面。
                relationResultDTOList.add(positionRelationResultDTO);
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


    /**
     * 新增员工
     *
     * @param employeeAddDto
     * @param
     * @return
     */
    public ResponseDTO<String> addEmployee(EmployeeAddDTO employeeAddDto) { //, RequestTokenBO requestToken
        EmployeeEntity entity = SmartBeanUtil.copy(employeeAddDto, EmployeeEntity.class);

        ////////////////////////////////// 对传入的值进行校验
        if (StringUtils.isNotEmpty(employeeAddDto.getIdCard())) {
            boolean checkResult = Pattern.matches(SmartVerificationUtil.ID_CARD, employeeAddDto.getIdCard());
            if (!checkResult) {
                return ResponseDTO.wrap(EmployeeResponseCodeConst.ID_CARD_ERROR);
            }
        }
        if (StringUtils.isNotEmpty(employeeAddDto.getBirthday())) {
            boolean checkResult = Pattern.matches(SmartVerificationUtil.DATE, employeeAddDto.getBirthday());
            if (!checkResult) {
                return ResponseDTO.wrap(EmployeeResponseCodeConst.BIRTHDAY_ERROR);
            }
        }
        if (StringUtils.isNotEmpty(employeeAddDto.getEmail())) {
            boolean checkResult = Pattern.matches(SmartVerificationUtil.EMAIL, employeeAddDto.getEmail());
            if (!checkResult) {
                return ResponseDTO.wrap(EmployeeResponseCodeConst.EMAIL_ERROR);
            }
        }
        //同名员工
        EmployeeDTO sameNameEmployee = employeeDao.getByLoginName(entity.getLoginName(), EmployeeStatusEnum.NORMAL.getValue());
        if (null != sameNameEmployee) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.LOGIN_NAME_EXISTS);
        }
        //同电话员工
        EmployeeDTO samePhoneEmployee = employeeDao.getByPhone(entity.getLoginName(), EmployeeStatusEnum.NORMAL.getValue());
        if (null != samePhoneEmployee) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.PHONE_EXISTS);
        }
        Long departmentId = entity.getDepartmentId();
        DepartmentEntity department = departmentDao.selectById(departmentId);
        if (department == null) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.DEPT_NOT_EXIST);
        }

        ////////////////////////////////// 如果没有密码  默认设置为123456
        String pwd = entity.getLoginPwd();
        if (StringUtils.isBlank(pwd)) {
            entity.setLoginPwd(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, RESET_PASSWORD));
        } else {
            entity.setLoginPwd(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, entity.getLoginPwd()));
        }

//        entity.setCreateUser(requestToken.getRequestUserId());
        entity.setCreateUser(1L);
        if (StringUtils.isEmpty(entity.getBirthday())) {
            entity.setBirthday(null);
        }
        ////////////////////////////////// 插入验证并且加密过密码的实体
        employeeDao.insert(entity);

        PositionRelationAddDTO positionRelAddDTO = new PositionRelationAddDTO(employeeAddDto.getPositionIdList(), entity.getId());
        //存储所选岗位信息
        positionService.addPositionRelation(positionRelAddDTO);

        return ResponseDTO.succ();
    }


}
