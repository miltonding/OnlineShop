package dao;

import java.util.Date;

import javax.servlet.http.Cookie;

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
import com.milton.shop.dao.UserMapper;
import com.milton.shop.model.User;
import com.milton.shop.util.CookieUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class UserDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private UserMapper userDao;

    public void setUserDao(UserMapper userDao) {
        this.userDao = userDao;
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
    public void getUserByUserName() {
        User user = userDao.getUserByUserName("admin.milton@shop.com");
        System.out.println(user.getPhoneNumber());
    }

    @Test
    public void createUser() {
        User user = new User();
        user.setUsername("12345678901");
        user.setPassword(CookieUtil.encodeCookie("abc123_"));
        user.setPhoneNumber("12345678901");
        user.setCreateTime(new Date());
        user.setIsEncypted(1);
        user.setIsDelete(0);
        int userid = userDao.createUser(user);
        System.out.println(userid);
        System.out.println(user.getPassword());
    }

   /* @Test
    public void testUpdateDisplayPicture() {
        User user = new User();
        user.setUserid(28);
        user.setDisplayPicture("123");
        System.out.println(userDao.updateDisplayPicture(user));
    }*/

    @Test
    public void testUpdateProfile() {
        User user = new User();
        user.setUserid(28);
        user.setScreenName("test....");
        user.setPhoneNumber("12345678901");
        user.setEmail("123");
        userDao.updateProfile(user);
        
    }

}
