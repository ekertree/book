package com.bookstore.pojo;

import java.util.List;

/**
 * page是分页模型对象
 * @param <T>是具体的模块的javabeam类
 */
public class Page<T> {

    public static final Integer PAGE_SIZE = 4;
    //当前页码
    private Integer pageNum;
    //总页码
    private Integer pageTotal;
    //当前页码显示数量
    private Integer pageSize = PAGE_SIZE;
    //总记录数
    private Integer pageTotalCount;
    //当前页数据
    private List<T> items;
    //分页条的请求地址
    private String url;

    public Page() {

    }

    public Page(Integer pageNum, Integer pageTotal, Integer pageTotalCount, List<T> items) {
        this.pageNum = pageNum;
        this.pageTotal = pageTotal;
        this.pageTotalCount = pageTotalCount;
        this.items = items;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        if(pageNum < 1)
            pageNum = 1;
        if(pageNum > pageTotal)
            pageNum = pageTotal;
        this.pageNum = pageNum;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize){
        this.pageSize = pageSize;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNum=" + pageNum +
                ", pageTotal=" + pageTotal +
                ", pageSize=" + pageSize +
                ", pageTotalCount=" + pageTotalCount +
                ", items=" + items +
                ", url='" + url + '\'' +
                '}';
    }
}

