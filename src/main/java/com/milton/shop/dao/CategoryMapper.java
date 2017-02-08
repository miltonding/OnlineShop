package com.milton.shop.dao;

import com.milton.shop.model.Category;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryMapper {
    int deleteByPrimaryKey(@Param("categoryid") Integer categoryid, @Param("kindid") Integer kindid);

    int insert(Category record);

    public Category selectByPrimaryKey(Integer categoryid);

    public List<Category> selectAll();

    int updateByPrimaryKey(Category record);

    public List<Category> selectByKindid(Integer kindid);
}