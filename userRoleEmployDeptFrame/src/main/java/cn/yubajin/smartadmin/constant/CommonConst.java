package cn.yubajin.smartadmin.constant;

import com.google.common.collect.ImmutableSet;
import org.apache.commons.collections.CollectionUtils;

import java.util.Set;

/**
 *
 * [ 通用常量 ]
 *
 * @version 1.0
 * @since JDK1.8
 * @author yandanyang
 * @company 1024lab.net
 * @copyright (c) 2019 1024lab.netInc. All rights reserved.
 * @date
 */
public class CommonConst {


    public static final class Page {
        public static final Integer SIZE = 10;
    }

    public static final class Password {
        public static final String DEFAULT = "123456";
        public static final String SALT_FORMAT = "smart_%s_admin";
    }


    public static final class CommonCollection {
        public static final Set<String> IGNORE_URL = ImmutableSet.of("/swagger", "Excel");


        public static Boolean contain(Set<String> ignores, String uri) {
            if (CollectionUtils.isEmpty(ignores)) {
                return false;
            }
            for (String ignoreUrl : ignores) {
                if (uri.startsWith(ignoreUrl)) {
                    return true;
                }
            }
            return false;
        }
    }

}
