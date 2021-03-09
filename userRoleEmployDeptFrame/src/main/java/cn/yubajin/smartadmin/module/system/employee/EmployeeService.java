package cn.yubajin.smartadmin.module.system.employee;

import cn.yubajin.smartadmin.common.constant.JudgeEnum;
import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.constant.CommonConst;
import cn.yubajin.smartadmin.module.system.department.DepartmentDao;
import cn.yubajin.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeResponseCodeConst;
import cn.yubajin.smartadmin.module.system.employee.constant.EmployeeStatusEnum;
import cn.yubajin.smartadmin.module.system.employee.domain.bo.EmployeeBO;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.*;
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
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
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
     * 员工基本信息的缓存
     */
    private static final ConcurrentHashMap<Long, EmployeeBO> employeeCache = new ConcurrentHashMap<>();


    /**
     * @param id
     * @return
     */
    public EmployeeBO getById(Long id) {
        EmployeeBO employeeBO = employeeCache.get(id);
        if (employeeBO == null) {
            EmployeeEntity employeeEntity = employeeDao.selectById(id);
            if (employeeEntity != null) {
//                Boolean superman = privilegeEmployeeService.isSuperman(id);
                ////// 后期处理superman问题
                employeeBO = new EmployeeBO(employeeEntity, false);
                employeeCache.put(employeeEntity.getId(), employeeBO);
            }
        }
        return employeeBO;
    }

    /**
     * 通过部门id获取当前部门的人员&没有部门的人
     * @param departmentId
     * @return
     */
    public ResponseDTO<List<EmployeeVO>> getEmployeeByDeptId(Long departmentId) {
        List<EmployeeVO> list = employeeDao.getEmployeeByDept(departmentId);
        return ResponseDTO.succData(list);
    }

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
     * 新增员工, 得存储对应岗位信息(一对多)
     *
     * @param employeeAddDto
     * @param
     * @return
     */
    public ResponseDTO<String> addEmployee(EmployeeAddDTO employeeAddDto, RequestTokenBO requestToken) { //
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

        entity.setCreateUser(requestToken.getRequestUserId());

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

    /**
     * 更新员工
     * @param employeeUpdateDTO
     * @return
     */
    public ResponseDTO<String> updateEmployee(EmployeeUpdateDTO employeeUpdateDTO) {
        Long employeeId = employeeUpdateDTO.getId();
        EmployeeEntity employeeEntity = employeeDao.selectById(employeeId);
        if(null == employeeEntity){
            return ResponseDTO.wrap(EmployeeResponseCodeConst.EMP_NOT_EXISTS);
        }
        /** 验证身份证号 **/
        if(StringUtils.isNotBlank(employeeUpdateDTO.getIdCard())){
            boolean matches = Pattern.matches(SmartVerificationUtil.ID_CARD, employeeUpdateDTO.getIdCard());
            if(!matches){
                return ResponseDTO.wrap(EmployeeResponseCodeConst.ID_CARD_ERROR);
            }
        }
        /** 验证日期 **/
        if (StringUtils.isNotEmpty(employeeUpdateDTO.getBirthday())) {
            boolean checkResult = Pattern.matches(SmartVerificationUtil.DATE, employeeUpdateDTO.getBirthday());
            if (!checkResult) {
                return ResponseDTO.wrap(EmployeeResponseCodeConst.BIRTHDAY_ERROR);
            }
        }
        Long departmentId = employeeUpdateDTO.getDepartmentId();
        DepartmentEntity departmentEntity = departmentDao.selectById(departmentId);
        if (departmentEntity == null) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.DEPT_NOT_EXIST);
        }
        /** 验证是否同名 **/
        EmployeeDTO sameNameEmployee = employeeDao.getByLoginName(employeeUpdateDTO.getLoginName(), EmployeeStatusEnum.NORMAL.getValue());
        if (null != sameNameEmployee && !sameNameEmployee.getId().equals(employeeId)) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.LOGIN_NAME_EXISTS);
        }
        /** 验证是否同手机号 **/
        EmployeeDTO samePhoneEmployee = employeeDao.getByPhone(employeeUpdateDTO.getLoginName(), EmployeeStatusEnum.NORMAL.getValue());
        if (null != samePhoneEmployee && !samePhoneEmployee.getId().equals(employeeId)) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.PHONE_EXISTS);
        }
        String newPwd = employeeUpdateDTO.getLoginPwd();
        if (!StringUtils.isBlank(newPwd)) {
            employeeUpdateDTO.setLoginPwd(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, employeeUpdateDTO.getLoginPwd()));
        } else {
            employeeUpdateDTO.setLoginPwd(employeeEntity.getLoginPwd());
        }
        EmployeeEntity entity = SmartBeanUtil.copy(employeeUpdateDTO, EmployeeEntity.class);
        entity.setUpdateTime(new Date());
        if (StringUtils.isEmpty(entity.getBirthday())) {
            entity.setBirthday(null);
        }
        if (CollectionUtils.isNotEmpty(employeeUpdateDTO.getPositionIdList())) {
            //删除旧的关联关系 添加新的关联关系
            positionService.removePositionRelation(entity.getId());
            PositionRelationAddDTO positionRelAddDTO = new PositionRelationAddDTO(employeeUpdateDTO.getPositionIdList(), entity.getId());
            positionService.addPositionRelation(positionRelAddDTO);
        }
        entity.setIsDisabled(employeeEntity.getIsDisabled());
        entity.setIsLeave(employeeEntity.getIsLeave());
        entity.setCreateUser(employeeEntity.getCreateUser());
        entity.setCreateTime(employeeEntity.getCreateTime());
        entity.setUpdateTime(new Date());
        employeeDao.updateById(entity);
        employeeCache.remove(employeeId);

        return ResponseDTO.succ();
    }

    /**
     * 更新密码
     *
     * @param updatePwdDTO
     * @param requestToken
     * @return
     */
    public ResponseDTO<String> updatePwd(EmployeeUpdatePwdDTO updatePwdDTO, RequestTokenBO requestToken) {
        Long employeeId = requestToken.getRequestUserId();
        EmployeeEntity employee = employeeDao.selectById(employeeId);
        if (employee == null) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.EMP_NOT_EXISTS);
        }
        /** 判断原密码是否正确 **/
        if (!employee.getLoginPwd().equals(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, updatePwdDTO.getOldPwd()))) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.PASSWORD_ERROR);
        }
        employee.setLoginPwd(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, updatePwdDTO.getPwd()));
        employeeDao.updateById(employee);
        employeeCache.remove(employeeId);
        return ResponseDTO.succ();
    }


    /**
     * 重置密码
     *
     * @param employeeId
     * @return
     */
    public ResponseDTO resetPasswd(Integer employeeId) {
        String md5Password = SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, RESET_PASSWORD);
        employeeDao.updatePassword(employeeId, md5Password);
        employeeCache.remove(employeeId);
        return ResponseDTO.succ();
    }

    /**
     * 删除员工
     *
     * @param employeeId 员工ID
     * @return
     */
    public ResponseDTO<String> deleteEmployeeById(Long employeeId) {
        EmployeeEntity employeeEntity = employeeDao.selectById(employeeId);
        if (null == employeeEntity) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.EMP_NOT_EXISTS);
        }
        //软删除
        employeeEntity.setIsDelete(JudgeEnum.YES.getValue().longValue());
        employeeDao.updateById(employeeEntity);
        employeeCache.remove(employeeId);
        return ResponseDTO.succ();
    }
    /**
     * 更新禁用状态
     *
     * @param employeeId
     * @param status
     * @return
     */
    public ResponseDTO<String> updateStatus(Long employeeId, Integer status) {
        if (null == employeeId) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.EMP_NOT_EXISTS);
        }
        EmployeeBO entity = getById(employeeId);
        if (null == entity) {
            return ResponseDTO.wrap(EmployeeResponseCodeConst.EMP_NOT_EXISTS);
        }
        List<Long> empIds = Lists.newArrayList();
        empIds.add(employeeId);
        employeeDao.batchUpdateStatus(empIds, status);
        employeeCache.remove(employeeId);
        return ResponseDTO.succ();
    }

    /**
     * 批量更新员工状态
     *
     * @param batchUpdateStatusDTO
     * @return
     */
    public ResponseDTO<String> batchUpdateStatus(EmployeeBatchUpdateStatusDTO batchUpdateStatusDTO) {
        employeeDao.batchUpdateStatus(batchUpdateStatusDTO.getEmployeeIds(), batchUpdateStatusDTO.getStatus());
        if (batchUpdateStatusDTO.getEmployeeIds() != null) {
            batchUpdateStatusDTO.getEmployeeIds().forEach(e -> employeeCache.remove(e));
        }
        return ResponseDTO.succ();
    }

}
