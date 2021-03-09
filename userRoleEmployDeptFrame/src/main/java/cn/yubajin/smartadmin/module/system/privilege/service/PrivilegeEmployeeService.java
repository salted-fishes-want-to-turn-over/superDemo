package cn.yubajin.smartadmin.module.system.privilege.service;

import com.googlecode.concurrentlinkedhashmap.ConcurrentLinkedHashMap;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentMap;

/**
 * [ 后台员工权限缓存方法 ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2018 1024lab.netInc. All rights reserved.
 * @date 2019/3/28 0028 下午 14:07
 * @since JDK1.8
 */
@Service
public class PrivilegeEmployeeService {

    /**
     * 后台用户权限缓存 <id,<controllerName,methodName></>></>
     */
    private ConcurrentMap<Long, Map<String, List<String>>> employeePrivileges = new ConcurrentLinkedHashMap.Builder<Long, Map<String, List<String>>>().maximumWeightedCapacity(1000).build();


    /**
     * 移除某人缓存中的权限
     *
     * @param employeeId
     */
    public void removeCache(Long employeeId) {
        this.employeePrivileges.remove(employeeId);
    }

}
