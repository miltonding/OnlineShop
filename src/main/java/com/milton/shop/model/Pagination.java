package com.milton.shop.model;

public class Pagination {

    // Keyword
    private String keyword;
    private int kindid;
    private int categoryid;
    private int productid;

    // Page
    private int quantity;
    private int pageSize;
    private int goalPage;
    // Order
    private String order;

    // Count
    private int offset;
    private int pageCount;

    public Pagination() {
        super();
    }

    public Pagination(int quantity, int pageSize, int goalPage) {
        super();
        this.quantity = quantity;
        this.pageSize = pageSize;
        this.goalPage = goalPage;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOffset() {
        offset = 0;
        if (pageSize <= 0 || goalPage <= 1) {
            return offset;
        }
        offset = (goalPage - 1)* pageSize;
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        pageCount = 0;
        if (quantity <= 0 || pageSize <= 0) {
            return pageCount;
        }
        if (quantity % pageSize == 0) {
            pageCount =  quantity/pageSize;
        } else {
            pageCount =  quantity/pageSize + 1;
        }
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getGoalPage() {
        return goalPage;
    }

    public void setGoalPage(int goalPage) {
        this.goalPage = goalPage;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getKindid() {
        return kindid;
    }

    public void setKindid(int kindid) {
        this.kindid = kindid;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

}
