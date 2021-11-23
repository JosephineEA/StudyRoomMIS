package team.mis.study.service;

import team.mis.study.entity.CustomerFinance;
import team.mis.study.entity.User;

import java.util.List;

/**
 * Time: 2021/9/10 11:04
 * Description: TODO
 */
public interface CustomerFinanceService {
    void add(CustomerFinance customerFinance);

    List<CustomerFinance> findByUser(User user);
}
