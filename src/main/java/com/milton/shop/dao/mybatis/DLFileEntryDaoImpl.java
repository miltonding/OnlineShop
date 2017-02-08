package com.milton.shop.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.DLFileEntryMapper;
import com.milton.shop.model.DLFileEntry;

public class DLFileEntryDaoImpl extends SqlSessionDaoSupport implements DLFileEntryMapper {

    private static final String CLASS_NAME = DLFileEntryMapper.class.getName();

    @Override
    public DLFileEntry getByPrimarykey(Integer entryid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByPrimarykey", entryid);
    }

    @Override
    public int insert(DLFileEntry entry) {
        getSqlSession().insert(CLASS_NAME + ".insert", entry);
        return entry.getEntryid();
    }

    @Override
    public DLFileEntry getByUserid(Integer userid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByUserid", userid);
    }

    @Override
    public int update(DLFileEntry entry) {
        return getSqlSession().update(CLASS_NAME + ".update", entry);
    }

    @Override
    public List<DLFileEntry> findGoodsEntry(Integer folderid, Integer productid) {
        Map<String, Integer> map = new HashMap<>();
        map.put("folderid", folderid);
        map.put("productid", productid);
        return getSqlSession().selectList(CLASS_NAME + ".findGoodsEntry", map);
    }


}
