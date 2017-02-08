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
import com.milton.shop.dao.AddressMapper;
import com.milton.shop.model.Address;
import com.milton.shop.model.wrapper.AddressWrapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class AddressDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private AddressMapper addressDao;

    public void setAddressDao(AddressMapper addressDao) {
        this.addressDao = addressDao;
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
    public void createAddress() {
        Address address = new Address();
        address.setUserid(1);
        address.setProvinceid(1);
        address.setCityid(1);
        address.setDistrictid(1);
        address.setReceiverName("milton");
        address.setZipCode(123);
        address.setDetailAddress("milton");
        address.setIsDefault(1);
        int addressid = addressDao.createAddress(address);
        System.out.println(addressid);
    }

    @Test
    public void testFindByuserid() {
        List<AddressWrapper> list = addressDao.findByuserid(1);
        for (AddressWrapper a : list) {
            System.out.println(a.getAddressid());
            System.out.println(a.getProvinceName());
            System.out.println(a.getCityName());
            System.out.println(a.getDistrictName());
            
        }
    }

    @Test
    public void testGetByAddressid() {
        Address address = new Address();
        address.setUserid(1);
        address.setAddressid(2);
        AddressWrapper a = addressDao.getUserAddress(address);
        if (a != null) {
            System.out.println(a.getAddressid());
            System.out.println(a.getProvinceName());
            System.out.println(a.getCityName());
            System.out.println(a.getDistrictName());
        } else {
            System.out.println(a);
        }
    }
}
