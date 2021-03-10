package cn.yubajin.smartadmin.module.system.role.roleemployee;

import cn.yubajin.smartadmin.common.domain.PageResultDTO;
import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.module.system.department.DepartmentDao;
import cn.yubajin.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import cn.yubajin.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import cn.yubajin.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import cn.yubajin.smartadmin.module.system.role.basic.RoleDao;
import cn.yubajin.smartadmin.module.system.role.basic.RoleResponseCodeConst;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleBatchDTO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleQueryDTO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.dto.RoleSelectedVO;
import cn.yubajin.smartadmin.module.system.role.basic.domain.entity.RoleEntity;
import cn.yubajin.smartadmin.module.system.role.roleemployee.domain.RoleEmployeeEntity;
import cn.yubajin.smartadmin.util.SmartBeanUtil;
import cn.yubajin.smartadmin.util.SmartPageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色管理业务
 *
 * @author zzr
 * @date 2019/4/3
 */
@Service
public class RoleEmployeeService {

    @Autowired
    private RoleEmployeeDao roleEmployeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private RoleDao roleDao;

    /**
     * 通过角色名称，分页获取成员员工列表
     *
     * @param queryDTO
     * @return
     */
    public ResponseDTO<PageResultDTO<EmployeeVO>> listEmployeeByRoleName(RoleQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        List<EmployeeDTO> employeeDTOS = roleEmployeeDao.selectEmployeeByNamePage(page, queryDTO);
        employeeDTOS.stream().filter(e -> e.getDepartmentId() != null).forEach(employeeDTO -> {
            DepartmentEntity departmentEntity = departmentDao.selectById(employeeDTO.getDepartmentId());
            employeeDTO.setDepartmentName(departmentEntity.getName());
        });
        /** 此处返回的employeeVO中没有position信息**/
        PageResultDTO<EmployeeVO> employeeVOPageResultDTO = SmartPageUtil.convert2PageResult(page, employeeDTOS, EmployeeVO.class);
        return ResponseDTO.succData(employeeVOPageResultDTO);
    }

    /**
     * 根据角色id 获取所有员工列表(不分页)
     *
     * @param roleId
     * @return
     */
    public ResponseDTO<List<EmployeeVO>> listAllEmployeeByRoleId(Long roleId) {
        List<EmployeeDTO> employeeDTOS = roleEmployeeDao.selectEmployeeByRoleId(roleId);
        List<EmployeeVO> employeeVOS = SmartBeanUtil.copyList(employeeDTOS, EmployeeVO.class);
        return ResponseDTO.succData(employeeVOS);
    }


    /**
     * 移除员工角色 (删除员工和角色的关系)
     *
     * @param employeeId
     * @param roleId
     * @return ResponseDTO<String>
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> removeEmployeeRole(Long employeeId, Long roleId) {
        if (null == employeeId || null == roleId) {
            return ResponseDTO.wrap(RoleResponseCodeConst.ERROR_PARAM);
        }
        roleEmployeeDao.deleteByEmployeeIdRoleId(employeeId, roleId);
        return ResponseDTO.succ();
    }

    /**
     * 批量删除某个角色下的某批用户的关联关系
     *
     * @param removeDTO
     * @return ResponseDTO<String>
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> batchRemoveEmployeeRole(RoleBatchDTO removeDTO) {
        List<Long> employeeIdList = removeDTO.getEmployeeIds();
        roleEmployeeDao.batchDeleteEmployeeRole(removeDTO.getRoleId(), employeeIdList);
        return ResponseDTO.succ();
    }

    /**
     * 批量添加角色的成员员工
     *
     * @param addDTO
     * @return ResponseDTO<String>
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> batchAddEmployeeRole(RoleBatchDTO addDTO) {
        /** 注意，传进来的参数时 roleId, employeeId, 一对多 **/
        Long roleId = addDTO.getRoleId();
        List<Long> employeeIdList = addDTO.getEmployeeIds();
        roleEmployeeDao.deleteByRoleId(roleId);
        List<RoleEmployeeEntity> roleRelationEntities = Lists.newArrayList();
        RoleEmployeeEntity employeeRoleRelationEntity;
        for (Long employeeId : employeeIdList) {
            employeeRoleRelationEntity = new RoleEmployeeEntity();
            employeeRoleRelationEntity.setRoleId(roleId);
            employeeRoleRelationEntity.setEmployeeId(employeeId);
            roleRelationEntities.add(employeeRoleRelationEntity);
        }
        /** 注意，数据库dao层传进去的参数时 roleId, employeeId, 为一对一 **/
        roleEmployeeDao.batchInsert(roleRelationEntities);
        return ResponseDTO.succ();
    }

    /**
     * 通过员工id获取员工角色
     *
     * @param employeeId
     * @return
     */
    public ResponseDTO<List<RoleSelectedVO>> getRolesByEmployeeId(Long employeeId) {
        List<Long> roleIds = roleEmployeeDao.selectRoleIdByEmployeeId(employeeId);
        List<RoleEntity> roleList = roleDao.selectList(null);
        List<RoleSelectedVO> result = SmartBeanUtil.copyList(roleList, RoleSelectedVO.class);
        result.stream().forEach(item -> item.setSelected(roleIds.contains(item.getId())));
        return ResponseDTO.succData(result);
    }
}
