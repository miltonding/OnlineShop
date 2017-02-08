package service;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.milton.shop.common.ServiceContext;
import com.milton.shop.constants.Constants;
import com.milton.shop.model.Address;
import com.milton.shop.model.User;
import com.milton.shop.service.UserService;
import com.milton.shop.util.CookieUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class UserServiceTest extends AbstractTransactionalJUnit4SpringContextTests {
    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
 
    @Before
    public void setUp() throws Exception {
        System.out.println("before.............................");
        ServiceContext serviceContext = ServiceContext.getServiceContext();
        serviceContext.addAttribute(Constants.HTTP_SESSION, new MockHttpSession());
    }

    @After
    public void tearDowm() throws Exception {
        System.out.println("after...........................");
        ServiceContext serviceContext = ServiceContext.getServiceContext();
        serviceContext.clear();
    }

    @Test
    public void login() {
        // No such user
        try {
            userService.login("123", "");
        } catch (Exception e) {
            e.printStackTrace();
        } 

        // Password is wrong
        try {
            userService.login("admin@milton.shop.com", "123");
        } catch (Exception e) {
            e.printStackTrace();
        } 

        // True user
        try {
            User user = userService.login("admin.milton@shop.com", "abc123_");
            System.out.println(user);
            System.out.println(user.getPassword());
            System.out.println(user.getIsEncypted());
            System.out.println(user.getLastLoginTime());
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    @Test
    public void register() {
        User user = new User();
        user.setUsername("12345678901");
        user.setPassword(CookieUtil.encodeCookie("abc123_"));
        user.setPhoneNumber("12345678901");
        user.setCreateTime(new Date());
        user.setIsEncypted(1);
        user.setIsDelete(0);
        Address address = new Address();
        address.setProvinceid(1);
        address.setCityid(1);
        address.setDistrictid(1);
        address.setReceiverName("milton");
        address.setZipCode(123);
        address.setDetailAddress("milton");
        address.setIsDefault(1);
        try {
            userService.createUserAndAddress(user,address);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
