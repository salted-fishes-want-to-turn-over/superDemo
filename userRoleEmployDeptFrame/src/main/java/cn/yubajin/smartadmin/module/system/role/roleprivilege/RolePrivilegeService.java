package cn.yubajin.smartadmin.module.system.role.roleprivilege;

import cn.yubajin.smartadmin.common.domain.ResponseDTO;
import cn.yubajin.smartadmin.module.system.privilege.dao.PrivilegeDao;
import cn.yubajin.smartadmin.module.system.privilege.domain.entity.PrivilegeEntity;
import cn.yubajin.smartadmin.module.system.role.basic.RoleDao;
import cn.yubajin.smartadmin.module.system.role.basic.RoleResponseCodeConst;
import cn.yubajin.smartadmin.module.system.role.basic.domain.entity.RoleEntity;
import cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.dto.RolePrivilegeDTO;
import cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.dto.RolePrivilegeSimpleDTO;
import cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.dto.RolePrivilegeTreeVO;
import cn.yubajin.smartadmin.module.system.role.roleprivilege.domain.entity.RolePrivilegeEntity;
import cn.yubajin.smartadmin.util.SmartBeanUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * [ 后台员工权限 ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 * @since JDK1.8
 */
@Service
public class RolePrivilegeService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private PrivilegeDao privilegeDao;

    @Autowired
    private RolePrivilegeDao rolePrivilegeDao;

    /**
     * 更新角色权限
     *
     * @param updateDTO
     * @return ResponseDTO
     */
    public ResponseDTO<String> updateRolePrivilege(RolePrivilegeDTO updateDTO) {
        /** 注意，传进来的参数时 roleId, privilegeId, 一对多 **/
        Long roleId = updateDTO.getRoleId();
        RoleEntity roleEntity = roleDao.selectById(roleId);
        if (null == roleEntity) {
            return ResponseDTO.wrap(RoleResponseCodeConst.ROLE_NOT_EXISTS);
        }
        /** 删除原来 角色-权限 关系 **/
        rolePrivilegeDao.deleteByRoleId(roleId);
        List<RolePrivilegeEntity> rolePrivilegeList = Lists.newArrayList();
        RolePrivilegeEntity rolePrivilegeEntity;
        for (String privilegeKey : updateDTO.getPrivilegeKeyList()) {
            rolePrivilegeEntity = new RolePrivilegeEntity();
            rolePrivilegeEntity.setRoleId(roleId);
            rolePrivilegeEntity.setPrivilegeKey(privilegeKey);
            rolePrivilegeList.add(rolePrivilegeEntity);
        }
        /** 注意，数据库dao层传进去的参数时 roleId, p rivilegeId, 为一对一
         * 插入新的 角色-权限 关系 **/
        rolePrivilegeDao.batchInsert(rolePrivilegeList);

        //////////////////// 处理在线用户的权限修改请求
//        privilegeEmployeeService.updateOnlineEmployeePrivilegeByRoleId(roleId);
        return ResponseDTO.succ();
    }

    public ResponseDTO<RolePrivilegeTreeVO> listPrivilegeByRoleId(Long roleId) {
        RolePrivilegeTreeVO rolePrivilegeTreeDTO = new RolePrivilegeTreeVO();
        rolePrivilegeTreeDTO.setRoleId(roleId);

        List<PrivilegeEntity> privilegeDTOList = privilegeDao.selectAll();
        if (CollectionUtils.isEmpty(privilegeDTOList)) {
            rolePrivilegeTreeDTO.setPrivilege(Lists.newArrayList());
            rolePrivilegeTreeDTO.setSelectedKey(Lists.newArrayList());
            return ResponseDTO.succData(rolePrivilegeTreeDTO);
        }
        //构造权限树
        List<RolePrivilegeSimpleDTO> privilegeList = this.buildPrivilegeTree(privilegeDTOList);
        //设置选中状态
        List<PrivilegeEntity> rolePrivilegeEntityList = rolePrivilegeDao.listByRoleId(roleId);
        List<String> privilegeKeyList = rolePrivilegeEntityList.stream().map(e -> e.getKey()).collect(Collectors.toList());
        rolePrivilegeTreeDTO.setPrivilege(privilegeList);
        rolePrivilegeTreeDTO.setSelectedKey(privilegeKeyList);
        return ResponseDTO.succData(rolePrivilegeTreeDTO);
    }

    /***
     * 将整个权限列表依据父子级别关系构建权限树
     * @param privilegeEntityList 所有权限列表
     * @return
     */
    private List<RolePrivilegeSimpleDTO> buildPrivilegeTree(List<PrivilegeEntity> privilegeEntityList) {
        List<RolePrivilegeSimpleDTO> privilegeTree = Lists.newArrayList();
        /** 首先找到树的根节点**/
        List<PrivilegeEntity> rootPrivilege = privilegeEntityList.stream().filter(e -> e.getParentKey() == null).collect(Collectors.toList());
        /** 对所有根节点按sort值进行排序 **/
        rootPrivilege.sort(Comparator.comparing(PrivilegeEntity::getSort));
        if (CollectionUtils.isEmpty(rootPrivilege)) {
            return privilegeTree;
        }
        privilegeTree = SmartBeanUtil.copyList(rootPrivilege, RolePrivilegeSimpleDTO.class);
        privilegeTree.forEach(e -> e.setChildren(Lists.newArrayList()));
        /** 构建权限子树 **/
        this.buildChildPrivilegeList(privilegeEntityList, privilegeTree);
        return privilegeTree;
    }

    /***
     * 递归构建权限子树
     * @param privilegeEntityList 所有的权限列表
     * @param parentMenuList 父权限列表
     */
    private void buildChildPrivilegeList(List<PrivilegeEntity> privilegeEntityList, List<RolePrivilegeSimpleDTO> parentMenuList) {
        List<String> parentKeyList = parentMenuList.stream().map(RolePrivilegeSimpleDTO :: getKey).collect(Collectors.toList());
        /** 根据parentkey从权限列表中找到父权限菜单 <列表> 的所有子节点(未按父权限分组) **/
        List<PrivilegeEntity> childEntityList = privilegeEntityList.stream().filter(e -> parentKeyList.contains(e.getParentKey())).collect(Collectors.toList());
        if (CollectionUtils.isEmpty(childEntityList)) {
            return;
        }
        /** 子权限列表按父菜单分组， 存放map, <key, value>  <parentKey, 权限实体> **/
        Map<String, List<PrivilegeEntity>> listMap = childEntityList.stream().collect(Collectors.groupingBy(PrivilegeEntity :: getParentKey));
        /** 循环父菜单列表，找到父菜单的子节点并setChildren进去,  **/
        for (RolePrivilegeSimpleDTO rolePrivilegeSimpleDTO : parentMenuList) {
            String key = rolePrivilegeSimpleDTO.getKey();
            List<PrivilegeEntity> privilegeEntities = listMap.get(key);
            if (CollectionUtils.isEmpty(privilegeEntities)) {
                continue;
            }
            privilegeEntities.sort(Comparator.comparing(PrivilegeEntity::getSort));
            List<RolePrivilegeSimpleDTO> privilegeList = SmartBeanUtil.copyList(privilegeEntities, RolePrivilegeSimpleDTO.class);
            privilegeList.forEach(e -> e.setChildren(Lists.newArrayList()));
            rolePrivilegeSimpleDTO.setChildren(privilegeList);
            this.buildChildPrivilegeList(privilegeEntityList, privilegeList);
        }
    }

}
