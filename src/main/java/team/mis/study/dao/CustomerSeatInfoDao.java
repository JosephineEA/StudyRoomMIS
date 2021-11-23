package team.mis.study.dao;

import team.mis.study.entity.CustomerSeatInfo;
import team.mis.study.entity.User;

import java.util.Date;
import java.util.List;

/**
 * Time: 2021/9/8 19:33
 * Description: TODO
 */
public interface CustomerSeatInfoDao {
    void add(CustomerSeatInfo customerSeatInfo);

    List<CustomerSeatInfo> findByUser(User user);

    CustomerSeatInfo findByPk(String id);

    List<CustomerSeatInfo> findAll();

    void deleteByPk(String id);

    void updateUseBeginTime(CustomerSeatInfo customerSeatInfo);

    void updateUseEndTime(CustomerSeatInfo customerSeatInfo);
}
