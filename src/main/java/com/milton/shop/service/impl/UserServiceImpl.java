package com.milton.shop.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.web.multipart.MultipartFile;

import com.milton.shop.constants.Constants;
import com.milton.shop.dao.AddressMapper;
import com.milton.shop.dao.CityMapper;
import com.milton.shop.dao.DistrictMapper;
import com.milton.shop.dao.UserMapper;
import com.milton.shop.dao.UserRoleMapper;
import com.milton.shop.exception.NoSuchUserException;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.City;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.District;
import com.milton.shop.model.User;
import com.milton.shop.model.UserRole;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.service.UserService;
import com.milton.shop.util.CookieUtil;
import com.milton.shop.util.DocumentsUtil;
import com.milton.shop.util.Validator;

public class UserServiceImpl implements UserService {
    private UserMapper userDao;
    private CityMapper cityDao;
    private DistrictMapper districtDao;
    private AddressMapper addressDao;
    private UserRoleMapper userRoleDao;

    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }

    public User login(String userName, String password) 
            throws NoSuchUserException, ServiceException {
        User user = userDao.getUserByUserName(userName);
        if (user == null) {
            throw new NoSuchUserException();
        }

        // User is deleted
        if (user.getIsDelete() == 1) {
            throw new NoSuchUserException();
        }

        // Whether password encrypted
        if (user.getIsEncypted() == 1) {
            password = CookieUtil.encodeCookie(password);
        }

        if (!user.getPassword().equals(password)) {
            throw new ServiceException(404, "Password is wrong");
        }

        // Password encrypted
        if (user.getIsEncypted() == 0) {
            this.updatepwdByUserid(user);
        }

        // Update last login time
        user.setLastLoginTime(new Date());
        userDao.updateLatLoginTime(user);

        return user;
    }

    public void updatepwdByUserid(User user) {
        // Whether password encrypted
        if (user.getIsEncypted() == 0) {
            user.setIsEncypted(1);
        }

        user.setPassword(CookieUtil.encodeCookie(user.getPassword()));
        user.setUpdateTime(new Date());
        userDao.updatePassword(user);
    }

    public Cookie getCookie(String nameSpace, String value) {
        Cookie cookie = null;

        if (!Validator.isNullEmptyString(value)) {
            // Cookie加密
            cookie = new Cookie(nameSpace, CookieUtil.encodeCookie(value));
            cookie.setDomain("localhost");
            cookie.setMaxAge(3600*24);
        }

        return cookie;
    }

    public boolean checkoutUserName(String username) {
        User user = userDao.getUserByUserName(username);
        if (Validator.isNullEmptyString(username)) {
            return false;
        }

        if (user == null) {
            return true;
        }
        return false;
    }

    public List<City> findCityByProvinceId(String provinceid) {
        return cityDao.findByProvinceId(Integer.parseInt(provinceid));
    }

    public List<District> findByCityId(String cityid) {
        return districtDao.findByCityId(Integer.parseInt(cityid));
    }

    public void createUserAndAddress(User user, Address address) throws Exception {
        try {
            // Create user
            int userid = userDao.createUser(user);

            // Assign role
            UserRole userRole = new UserRole();
            userRole.setUserid(userid);
            userRole.setRoleid(Constants.ROLE_CUSTOMER);
            userRoleDao.insert(userRole);

            //Create Address
            address.setUserid(userid);
            address.setPhoneNumber(user.getPhoneNumber());
            addressDao.createAddress(address);
        } catch(Exception e) {
            throw e;
        }
    }

    public String uploadHeader(MultipartFile file, int userid) throws ServiceException {
        try {
            //upload File
            DLFileEntry entry = DocumentsUtil.uploadHeader(file, userid, null);
            // Update User
            User user = new User();
            user.setUserid(userid);
            user.setHeaderEntryid(entry.getEntryid());
            userDao.updateHeader(user);
            return entry.getDisplayPath();
        } catch (ServiceException e) {
            throw e;
        }
    }

    public List<AddressWrapper> findAddressWrapper(int userid) {
        return addressDao.findByuserid(userid);
    }

    public void updateProfile(User user) {
        userDao.updateProfile(user);
    }

    public void setUserDao(UserMapper userDao) {
        this.userDao = userDao;
    }

    public void setCityDao(CityMapper cityDao) {
        this.cityDao = cityDao;
    }

    public void setDistrictDao(DistrictMapper districtDao) {
        this.districtDao = districtDao;
    }

    public void setAddressDao(AddressMapper addressDao) {
        this.addressDao = addressDao;
    }

    public void setUserRoleDao(UserRoleMapper userRoleDao) {
        this.userRoleDao = userRoleDao;
    }
}
