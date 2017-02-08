package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.KindMapper;
import com.milton.shop.model.Kind;

public class KindDaoImpl extends SqlSessionDaoSupport implements KindMapper {

    private static final String CLASS_NAME = KindMapper.class.getName();

    @Override
    public int deleteByPrimaryKey(Integer kindid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Kind record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Kind selectByPrimaryKey(Integer kindid) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Kind> selectAll() {
        return getSqlSession().selectList(CLASS_NAME + ".selectAll");
    }

    @Override
    public int updateByPrimaryKey(Kind record) {
        // TODO Auto-generated method stub
        return 0;
    }

}
