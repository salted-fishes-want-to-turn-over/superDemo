package com.example.controller;


import com.example.common.utils.R;
import com.example.common.utils.validateUtils.Insert;
import com.example.common.utils.validateUtils.Update;
import com.example.entity.DTO.DeptDTO;
import com.example.entity.Dept;
import com.example.service.IDeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yubajin
 * @since 2021-01-04
 */
@RestController
@RequestMapping("/dept")
@Api(value = "Dept操作Api", tags = "Dept操作Api")
public class DeptController {

    @Autowired
    private IDeptService deptService;

    @PostMapping("/addDept")
    @ApiOperation("新增Dept")
    public R saveOne(@RequestBody @Validated(Insert.class) DeptDTO deptDTO){
        Integer i = deptService.saveOne(deptDTO);
        if (i > 0){
            return R.ok("操作成功!");
        }else {
            return R.error("操作失败!");
        }
    }

    @GetMapping("/getDept")
    @ApiOperation("获得dept")
    public R getDept(@RequestParam("deptNo") Long id){
        Dept deptList = deptService.getDeptById(id);
        return R.ok().setData(deptList);
    }

    @PutMapping("/updateDept")
    @ApiOperation("根据部门表的id修改部门信息")
    public R updateDept(@RequestBody @Validated(Update.class) DeptDTO deptDTO){
        Boolean flag = deptService.updateDeptById(deptDTO);
        if (flag){
            return R.ok("操作成功");
        }else{
            return R.ok("操作失败");
        }

    }

    @ApiOperation("excel导入信息")
    @PostMapping(value = "/upload")
    public R uploadFile(@ApiParam("file")
                        @RequestParam(value = "file", required=true) MultipartFile file) throws Exception {
        ArrayList<DeptDTO> deptDTOS= new ArrayList<>();

        //将上传的excel的每条数据解析出来，批量插入数据库


        int j = deptService.batchSave(deptDTOS);
        if (j>0){
            return R.ok("操作成功");
        }else{
            return R.error("操作失败");
        }
    }

}
