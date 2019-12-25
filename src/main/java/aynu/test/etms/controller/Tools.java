package aynu.test.etms.controller;

import java.util.UUID;

public class Tools {
    /**
     * 返回一个不重复的字符串
     * @return
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }
}
