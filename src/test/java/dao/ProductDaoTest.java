package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.milton.shop.dao.ProductMapper;
import com.milton.shop.model.Product;
import com.milton.shop.model.wrapper.ProductWrapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class ProductDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private ProductMapper productDao;

    public void setProductMapper(ProductMapper productDao) {
        this.productDao = productDao;
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
    public void TestFindByKindid() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ProductWrapper> list = productDao.findByKindid(1, 10);
        for (ProductWrapper product : list) {
            System.out.println(product.getKindid());
        }
    }

    @Test
    public void TestSelectByPrimaryKey() {
        Product selectByPrimaryKey = productDao.selectByPrimaryKey(3);
        System.out.println(selectByPrimaryKey);
    }
}
