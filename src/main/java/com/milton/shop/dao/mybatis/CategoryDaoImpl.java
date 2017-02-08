package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.CategoryMapper;
import com.milton.shop.model.Category;

public class CategoryDaoImpl extends SqlSessionDaoSupport implements CategoryMapper {

    private static final String CLASS_NAME = CategoryMapper.class.getName();

    @Override
    public int deleteByPrimaryKey(Integer categoryid, Integer kindid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Category record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Category selectByPrimaryKey(Integer categoryid) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Category> selectAll() {
        return getSqlSession().selectList(CLASS_NAME + ".selectAll");
    }

    @Override
    public int updateByPrimaryKey(Category record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<Category> selectByKindid(Integer kindid) {
        return getSqlSession().selectList(CLASS_NAME + ".selectByKindid", kindid);
    }

}
