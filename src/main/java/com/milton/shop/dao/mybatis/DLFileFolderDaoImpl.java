package com.milton.shop.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.DLFileFolderMapper;
import com.milton.shop.model.DLFileFolder;

public class DLFileFolderDaoImpl extends SqlSessionDaoSupport implements DLFileFolderMapper {

    private static final String CLASS_NAME = DLFileFolderMapper.class.getName();

    @Override
    public DLFileFolder getByPrimarykey(Integer folderid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByPrimarykey", folderid);
    }

    @Override
    public DLFileFolder getByTitle(String title) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByTitle", title);
    }

}
