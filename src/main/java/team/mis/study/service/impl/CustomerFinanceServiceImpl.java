package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.CustomerFinanceDao;
import team.mis.study.entity.CustomerFinance;
import team.mis.study.entity.User;
import team.mis.study.service.CustomerFinanceService;

import java.util.List;

/**
 * Time: 2021/9/10 11:06
 * Description: TODO
 */
@Service
public class CustomerFinanceServiceImpl implements CustomerFinanceService {
    @Autowired
    CustomerFinanceDao customerFinanceDao;

    @Override
    public void add(CustomerFinance customerFinance) {
        customerFinanceDao.add(customerFinance);
    }

    @Override
    public List<CustomerFinance> findByUser(User user) {
        return customerFinanceDao.findByUser(user);
    }
}
