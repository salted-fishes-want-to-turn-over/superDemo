package com.example;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;


@SpringBootApplication
@MapperScan("com.example.mapper")
public class MicroservicecloudProviderDeptApplication {
    public static void main(String[] args) {
        SpringApplication.run(MicroservicecloudProviderDeptApplication.class, args);
    }
}
