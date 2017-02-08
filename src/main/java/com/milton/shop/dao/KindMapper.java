package com.milton.shop.dao;

import com.milton.shop.model.Kind;
import java.util.List;

public interface KindMapper {
    int deleteByPrimaryKey(Integer kindid);

    int insert(Kind record);

    Kind selectByPrimaryKey(Integer kindid);

    public List<Kind> selectAll();

    int updateByPrimaryKey(Kind record);
}