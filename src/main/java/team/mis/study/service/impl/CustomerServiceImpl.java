package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.CustomerDao;
import team.mis.study.entity.Customer;
import team.mis.study.entity.User;
import team.mis.study.service.CustomerService;

import java.util.List;

/**
 * Time: 2021/9/8 20:10
 * Description: TODO
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    @Override
    public Customer findByUser(User user) {
        return customerDao.findByUser(user);
    }

    @Override
    public void updateMoney(Customer customer) {
        customerDao.updateMoney(customer);
    }

    @Override
    public void add(Customer customer) {
        customerDao.add(customer);
    }

    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public void updateViolationCount(Customer customer) {
        customerDao.updateViolationCount(customer);
    }
}
