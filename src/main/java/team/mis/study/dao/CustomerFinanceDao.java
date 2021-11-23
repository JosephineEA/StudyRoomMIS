package team.mis.study.dao;

import team.mis.study.entity.CustomerFinance;
import team.mis.study.entity.User;

import java.util.List;

/**
 * Time: 2021/9/10 11:07
 * Description: TODO
 */
public interface CustomerFinanceDao {
    void add(CustomerFinance customerFinance);

    List<CustomerFinance> findByUser(User user);
}
