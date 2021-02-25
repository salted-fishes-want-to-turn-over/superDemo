package com.example.common.utils;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 统一分页结果
 * @date 2020-01-19 16:40
 */
@Data
public class PageUtil<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 总记录数
     */
    private long totalCount;
    /**
     * 每页记录数
     */
    private long pageSize;
    /**
     * 总页数
     */
    private long totalPage;
    /**
     * 当前页数
     */
    private long currPage;
    /**
     * 列表数据
     */
    private List<T> list;

    public PageUtil(List<T> list, long totalCount, int pageSize, int currPage) {
        this.list = list;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currPage = currPage;
        this.totalPage = (int) Math.ceil((double) totalCount / pageSize);
    }

    public PageUtil(Page<T> page) {
        this.list = page.getRecords();
        this.totalCount = page.getTotal();
        this.pageSize = page.getSize();
        this.currPage = page.getCurrent();
        this.totalPage = page.getPages();
    }

    public PageUtil(IPage<T> iPage) {
        this.totalCount = iPage.getTotal();
        this.pageSize = iPage.getSize();
        this.totalPage = iPage.getPages();
        this.currPage = iPage.getCurrent();
        this.list = iPage.getRecords();
    }

    private static int getOffset(Integer page, Integer limit) {
        page = page==null?1:page;
        limit = limit==null?10:limit;
        return (page-1)*limit;
    }

}
