package com.milton.shop.dao;

import com.milton.shop.model.Address;
import com.milton.shop.model.wrapper.AddressWrapper;

import java.util.List;

public interface AddressMapper {
    List<Address> selectAll();

    public int updateAddress(Address record);

    public AddressWrapper getUserAddress(Address address);

    public int createAddress(Address record);

    public List<AddressWrapper> findByuserid(int userid);

    public int deleteByPrimaryKey(Integer addressid);

    public int updateDefaultAddress(Integer addressid, Integer isDefault);
    
    public Address getDefaultAddress(Integer userid);
}