package com.milton.shop.dao;

import java.util.List;

import com.milton.shop.model.DLFileEntry;

public interface DLFileEntryMapper {

    public DLFileEntry getByPrimarykey (Integer entryid);

    public DLFileEntry getByUserid (Integer userid);

    public int insert (DLFileEntry entry);

    public int update(DLFileEntry entry);

    public List<DLFileEntry> findGoodsEntry(Integer folderid, Integer productid);
}
