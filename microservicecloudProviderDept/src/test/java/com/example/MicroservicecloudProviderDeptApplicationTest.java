package com.example;

import com.example.MicroservicecloudProviderDeptApplication;
import com.example.entity.Dept;
import com.example.mapper.DeptMapper;
import com.example.service.IDeptService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest()
public class MicroservicecloudProviderDeptApplicationTest {
    /**
     * Spring Boot 默认已经配置好了数据源，程序员可以直接 DI 注入然后使用即可
     */

    @Autowired
    private IDeptService deptService;
    @Test
    public void contextLoads(){
        Dept deptList = deptService.getDeptById(1L);
        System.out.println(deptList);
//        deptList.forEach(System.out::println);

    }
}