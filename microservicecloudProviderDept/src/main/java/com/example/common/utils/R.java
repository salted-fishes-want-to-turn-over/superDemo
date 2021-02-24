package com.example.common.utils;


import com.alibaba.fastjson.JSONObject;

import java.util.Map;

/**
 * 统一返回体
 * @author yubajin
 * @since 2021-01-04
 */
public class R extends JSONObject {
    private static final long serialVersionUID = 1L;

    public static R ok() {
        return new R().setCode(0).success(true);
    }

    public static R ok(String msg) {
        return R.ok(0, msg);
    }

    public static R ok(int code, String msg) {
        return new R().setCode(code).setMsg(msg);
    }

    public static R ok(int code, String msg, Object data) {
        return R.ok(code, msg).setData(data);
    }

    public static R error() {
        return R.error("");
    }

    public static R error(String msg) {
        return R.error(500, msg);
    }

    public static R error(int code, String msg) {
        return new R()
                .success(false)
                .setCode(code)
                .setMsg(msg);
    }
    public static R ok(Map<String, Object> map) {
        R r = new R();
        r.putAll(map);
        return r;
    }

    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    public R setData(Object data) {
        this.put("data", data);
        return this;
    }

    public R setCode(int code) {
        this.put("code", code);
        return this;
    }

    public R setMsg(String msg) {
        this.put("msg", msg);
        return this;
    }

    public R setMsg(JSONObject msg) {
        this.put("msg", msg);
        return this;
    }

    private R success(boolean success) {
        this.put("success", success);
        return this;
    }

    private R() {
    }
}


