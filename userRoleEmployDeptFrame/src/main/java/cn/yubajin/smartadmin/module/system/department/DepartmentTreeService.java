package cn.yubajin.smartadmin.module.system.department;

import cn.yubajin.smartadmin.module.system.department.domain.vo.DepartmentVO;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * [  ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2018 1024lab.netInc. All rights reserved.
 * @date 2019/4/29 0029 下午 13:52
 * @since JDK1.8
 */
@Service
public class DepartmentTreeService {

    @Autowired
    private DepartmentDao departmentDao;

    /**
     * 构建部门树结构
     * @param departmentVOList
     * @return
     */
    public List<DepartmentVO> buildTree(List<DepartmentVO> departmentVOList) {
        if(CollectionUtils.isEmpty(departmentVOList)){
            return Lists.newArrayList();
        }
        List<DepartmentVO> list = departmentVOList.stream().filter(e -> e.getParentId() == null || e.getParentId() == 0).collect(Collectors.toList());
        if(CollectionUtils.isEmpty(list)){
            return Lists.newArrayList();
        }
        this.buildTree(list,departmentVOList);
        return list;
    }

    private void buildTree(List<DepartmentVO> nodeList,List<DepartmentVO> departmentVOList){
        int nodeSize = nodeList.size();
        for(int i =0 ;i< nodeSize;i++){
            int preIndex = i-1;
            int nextIndex = i+1;
            DepartmentVO node = nodeList.get(i);
            if(preIndex>-1){
                node.setPreId(nodeList.get(preIndex).getId());
            }
            if(nextIndex<nodeSize){
                node.setNextId(nodeList.get(nextIndex).getId());
            }
            buildTree(node, departmentVOList);
        }
    }

    private void buildTree(DepartmentVO node, List<DepartmentVO> departmentVOList) {
        List<DepartmentVO> children = getChildren(node, departmentVOList);
        if (!CollectionUtils.isEmpty(children)) {
            node.setChildrenDepartment(children);
            this.buildTree(children,departmentVOList);
        }
    }

    private List<DepartmentVO> getChildren(DepartmentVO node, List<DepartmentVO> departmentVOList) {
        Long id = node.getId();
        return departmentVOList.stream().filter(e -> id.equals(e.getParentId())).collect(Collectors.toList());
    }


}
