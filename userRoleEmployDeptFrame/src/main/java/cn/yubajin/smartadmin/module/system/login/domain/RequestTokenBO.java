package cn.yubajin.smartadmin.module.system.login.domain;

import cn.yubajin.smartadmin.module.system.employee.domain.bo.EmployeeBO;
import lombok.Getter;


/**
 * @author yubajin
 */
@Getter
public class RequestTokenBO {

    private Long requestUserId;

    private EmployeeBO employeeBO;

    public RequestTokenBO(EmployeeBO employeeBO) {
        this.requestUserId = employeeBO.getId();
        this.employeeBO = employeeBO;
    }

    @Override
    public String toString() {
        return "RequestTokenBO{" +
                "requestUserId=" + requestUserId +
                ", employeeBO=" + employeeBO +
                '}';
    }
}
