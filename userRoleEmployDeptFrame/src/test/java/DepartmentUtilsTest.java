import cn.yubajin.smartadmin.module.system.department.domain.vo.DepartmentVO;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public class DepartmentUtilsTest {
    
    @Test
    public void testStream(){
        List<DepartmentVO> departmentVOList = new ArrayList();

        Map<Long, DepartmentVO> collect = departmentVOList.stream().collect(Collectors.toMap(DepartmentVO::getId, Function.identity()));

        List<DepartmentVO> list = departmentVOList.stream().filter(e -> e.getParentId() == null || e.getParentId() == 0).collect(Collectors.toList());

    }
}
