package team.mis.study.dao;

import team.mis.study.entity.Customer;
import team.mis.study.entity.User;

import java.util.List;

/**
 * Time: 2021/9/8 20:11
 * Description: TODO
 */
public interface CustomerDao {
    Customer findByUser(User user);

    void updateMoney(Customer customer);

    void add(Customer customer);

    List<Customer> findAll();

    void updateViolationCount(Customer customer);
}
