package cn.yubajin.smartadmin.module.system.position;


import cn.yubajin.smartadmin.common.constant.ResponseCodeConst;

/**
 * @author zzr
 */
public class PositionResponseCodeConst extends ResponseCodeConst {

    public static final PositionResponseCodeConst REMOVE_DEFINE = new PositionResponseCodeConst(13000, "还有人关联该岗位,不能删除");

    public static final PositionResponseCodeConst POSITION_NO_FOUND = new PositionResponseCodeConst(13001, "没有该岗位信息");

    protected PositionResponseCodeConst(int code, String msg) {
        super(code, msg);
    }

}
