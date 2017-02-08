package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.AddressMapper;
import com.milton.shop.model.Address;
import com.milton.shop.model.wrapper.AddressWrapper;

public class AddressDaoImpl extends SqlSessionDaoSupport implements AddressMapper {
    private static final String CLASS_NAME = AddressMapper.class.getName();

    public List<Address> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateAddress(Address record) {
        return getSqlSession().update(CLASS_NAME + ".updateAddress", record);
    }

    public int createAddress(Address record) {
        getSqlSession().insert(CLASS_NAME + ".createAddress", record);
        return record.getAddressid();
    }
 
    public List<AddressWrapper> findByuserid(int userid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByuserid", userid);
    }

    public AddressWrapper getUserAddress(Address address) {
        return getSqlSession().selectOne(CLASS_NAME + ".getUserAddress", address);
    }

    public int deleteByPrimaryKey(Integer addressid) {
        return getSqlSession().delete(CLASS_NAME + ".deleteByPrimaryKey", addressid);
    }

    public int updateDefaultAddress(Integer addressid, Integer isDefault) {
        Address address = new Address();
        address.setAddressid(addressid);
        address.setIsDefault(isDefault);
        return getSqlSession().update(CLASS_NAME + ".updateDefaultAddress", address);
    }

    public Address getDefaultAddress(Integer userid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getDefaultAddress", userid);
    }

}
