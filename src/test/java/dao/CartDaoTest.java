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
import com.milton.shop.dao.CartMapper;
import com.milton.shop.model.Cart;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class CartDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private CartMapper cartDao;

    public void setCartDao(CartMapper cartDao) {
        this.cartDao = cartDao;
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
    public void testAddCart() {
        Cart cart = new Cart();
        cart.setUserid(1);
        cart.setGoodsid(1);
        cart.setQuantity(1);
        cart.setIsPay(0);
        cart.setIsDelete(0);
        cartDao.addCart(cart);
    }

    @Test
    public void testGetCart() {
        Cart cart = new Cart();
        cart.setUserid(1);
        cart.setGoodsid(1);
        Cart cart1 = cartDao.getByUseridAndGoodsid(cart);
        System.out.println(cart1);
    }

    @Test
    public void testfindByUserid() {
        List<Cart> list = cartDao.findByUserid(1);
        for (Cart cart : list) {
            System.out.println(cart.getGoodsid() + " , " + cart.getQuantity());
        }
    }
}
