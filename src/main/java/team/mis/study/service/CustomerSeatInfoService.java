package team.mis.study.service;

import team.mis.study.entity.CustomerSeatInfo;
import team.mis.study.entity.User;

import java.util.Date;
import java.util.List;

/**
 * Time: 2021/9/10 18:44
 * Description: TODO
 */
public interface CustomerSeatInfoService {
    List<CustomerSeatInfo> findByUser(User user);

    List<CustomerSeatInfo> findUnfinishedByUser(User user);

    CustomerSeatInfo findByPk(String id);

    List<CustomerSeatInfo> findAll();

    void deleteByPk(String id);

    void updateUseBeginTime(CustomerSeatInfo customerSeatInfo);

    void updateUseEndTime(CustomerSeatInfo customerSeatInfo);
}
