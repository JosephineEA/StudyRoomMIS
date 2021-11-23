package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.CustomerPersonalDao;
import team.mis.study.entity.CustomerPersonal;
import team.mis.study.service.CustomerPersonalService;

/**
 * Time: 2021/9/10 16:03
 * Description: TODO
 */
@Service
public class CustomerPersonalServiceImpl implements CustomerPersonalService {
    @Autowired
    CustomerPersonalDao customerPersonalDao;

    @Override
    public void add(CustomerPersonal customerPersonal) {
        customerPersonalDao.add(customerPersonal);
    }
}
