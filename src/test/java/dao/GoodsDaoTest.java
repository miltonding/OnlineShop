package dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.milton.shop.common.ServiceContext;
import com.milton.shop.constants.Constants;
import com.milton.shop.dao.GoodsMapper;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.wrapper.GoodsWrapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class GoodsDaoTest {
    @Autowired
    private GoodsMapper goodsDao;

    public void setGoodsDao(GoodsMapper goodsDao) {
        this.goodsDao = goodsDao;
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
    public void testQty() {
        Pagination pagination = new Pagination(30, 10, 1);
        //pagination.setKindid(1);
        pagination.setProductid(3);
        int count = goodsDao.getGoodsQuantity(pagination);
        System.out.println(count);
    }

    @Test
    public void testDynamicQuery() {
        Pagination pagination = new Pagination(30, 10, 1);
        //pagination.setKindid(1);
        pagination.setProductid(3);
        List<GoodsWrapper> list = goodsDao.dynamicQuery(pagination);
        for (GoodsWrapper w : list) {
            System.out.println(w.getQuantity());
        }
    }

    @Test
    public void testGet() {
        GoodsWrapper goods = goodsDao.getByPrimaryKey(1);
        System.out.println(goods.getQuantity());
    }

    @Test
    public void testFindGoods() {
        List<Integer> list = new ArrayList<Integer>();
        list.add(1);
        list.add(2);
        list.add(3);
        List<GoodsWrapper> list2 = goodsDao.findGoods(list);
        for (GoodsWrapper w : list2) {
            System.out.println(w.getQuantity());
        }
    }
}
