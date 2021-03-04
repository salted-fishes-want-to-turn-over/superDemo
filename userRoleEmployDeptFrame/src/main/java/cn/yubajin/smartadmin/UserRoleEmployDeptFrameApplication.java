package cn.yubajin.smartadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * [ admin 项目启动类 ]
 *
 * @author yandanyang
 * @version 1.0
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 * @since JDK1.8
 *
 */
@SpringBootApplication(scanBasePackages = {"cn.yubajin.smartadmin.module"})
@EnableCaching
@EnableScheduling
public class UserRoleEmployDeptFrameApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserRoleEmployDeptFrameApplication.class, args);
    }
}
