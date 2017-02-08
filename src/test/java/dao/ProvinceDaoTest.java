package dao;

import java.util.List;

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
import com.milton.shop.dao.ProvinceMapper;
import com.milton.shop.dao.UserMapper;
import com.milton.shop.model.Province;
import com.milton.shop.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class ProvinceDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private ProvinceMapper provinceDao;

    public void setProvinceDao(ProvinceMapper provinceDao) {
        this.provinceDao = provinceDao;
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
    public void provinceList() {
        List<Province> list = provinceDao.selectAll();
        for (Province province : list) {
            System.out.println(province.getProvinceName());
        }
    }

}
