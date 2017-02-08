package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.CategoryMapper;
import com.milton.shop.model.Category;
import com.milton.shop.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

    private CategoryMapper categoryDao;

    @Override
    public List<Category> findList() {
        return categoryDao.selectAll();
    }

    public void setCategoryDao(CategoryMapper categoryDao) {
        this.categoryDao = categoryDao;
    }
}
