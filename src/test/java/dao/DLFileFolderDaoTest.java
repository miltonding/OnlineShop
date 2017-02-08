package dao;

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
import com.milton.shop.dao.DLFileEntryMapper;
import com.milton.shop.dao.DLFileFolderMapper;
import com.milton.shop.model.DLFileEntry;
import com.milton.shop.model.DLFileFolder;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:shop-mvc.xml"})
public class DLFileFolderDaoTest  extends AbstractTransactionalJUnit4SpringContextTests {
    @Autowired
    private DLFileEntryMapper dlFileEntryDao;


    public void setDlFileEntryDao(DLFileEntryMapper dlFileEntryDao) {
        this.dlFileEntryDao = dlFileEntryDao;
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
        DLFileEntry entry = dlFileEntryDao.getByPrimarykey(6);
        entry.setDescription("1412541");
        dlFileEntryDao.update(entry);
    }
}
