package com.example.controller;

import com.example.common.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.common.utils.FastdfsClientUtil;
/**
 * @auther:chent69
 * @date: 2020/1/21-10 :45
 */
@RestController
@Api(tags = "文件服务器相关接口")
@RequestMapping("file")
public class FastdfsController {
    @Resource
    FastdfsClientUtil fastdfsClientUtil;

    @PostMapping("uploadExcel")
    @ApiOperation("上传文件到服务器")
    @ApiImplicitParam(name = "file",value = "Excel文件",required = true,dataType = "MultipartFile")
    public R uploadExcel(@RequestParam("file") MultipartFile file){
        String[] formats = {"xls","xlsx"};
        String suffixName = FilenameUtils.getExtension(file.getOriginalFilename());
        boolean fileIsValid = false;
        //文件格式判断
        for(String format: formats){
            if(StringUtils.equals(suffixName , format)){
                fileIsValid = true;
                break;
            }
        }
        if(!fileIsValid){
            return R.error("file format is not supported!");
        }

        String fileStorePath = null;
        try{
            fileStorePath = fastdfsClientUtil.uploadFile(file);
        }catch (IOException e){
            e.printStackTrace();
        }
        return R.ok().put("File StoreUrl: ",fileStorePath);
    }

    @PostMapping("uploadImage")
    @ApiOperation("上传图片到服务器")
    @ApiImplicitParam(name = "file",value = "图片文件",required = true,dataType = "MultipartFile")
    public R uploadImage(@RequestParam("file") MultipartFile file){
        String imageStorePath = null;
        try{
            imageStorePath = fastdfsClientUtil.uploadImage(file);
        }catch (IOException e){
            e.printStackTrace();
        }
        return R.ok().put("imageStoreUrl" , imageStorePath);
    }

    @PostMapping("uploadImageAndCrtThumb")
    @ApiOperation("上传图片到服务器并压缩")
    @ApiImplicitParam(name = "file",value = "图片文件",required = true,dataType = "MultipartFile")
    public R uploadImageAndCrtThumb(@RequestParam("file") MultipartFile file){
        String imageStorePath = null;
        try{
            imageStorePath = fastdfsClientUtil.uploadImageAndCrtThumb(file);
        }catch (IOException e){
            e.printStackTrace();
        }
        return R.ok().put("imageStoreUrl" , imageStorePath);
    }

    @RequestMapping("download")
    @ApiOperation("从服务器上下载文件")
    @ApiImplicitParam(name = "fileUrl",value = "文件存储地址",required = true,dataType = "String")
    public void download(HttpServletResponse response , @RequestParam("fileUrl") String fileUrl){
        try{
            fastdfsClientUtil.downLoadFile(response , fileUrl,"图片");
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @DeleteMapping
    @ApiOperation("删除服务器上的文件")
    @ApiImplicitParam(name = "fileUrl",value = "文件存储地址",required = true,dataType = "String")
    public R delete(@RequestParam("fileUrl") String fileUrl){
        if( fastdfsClientUtil.deleteFile(fileUrl)){
            return R.ok();
        }
        return R.error();
    }
}
