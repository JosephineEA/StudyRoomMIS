package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.CustomerSeatInfoDao;
import team.mis.study.entity.CustomerSeatInfo;
import team.mis.study.entity.User;
import team.mis.study.service.CustomerSeatInfoService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Time: 2021/9/10 18:45
 * Description: TODO
 */
@Service
public class CustomerSeatInfoServiceImpl implements CustomerSeatInfoService {
    @Autowired
    CustomerSeatInfoDao customerSeatInfoDao;

    @Override
    public List<CustomerSeatInfo> findByUser(User user) {
        return customerSeatInfoDao.findByUser(user);
    }

    @Override
    public List<CustomerSeatInfo> findUnfinishedByUser(User user) {
        // TODO：用了糟糕的方式，以后重写一个sql
        List<CustomerSeatInfo> lst = findByUser(user);
        List<CustomerSeatInfo> res = new ArrayList<>();
        for (CustomerSeatInfo csi : lst) {
            if (csi.getUseEndTime() == null) {
                res.add(csi);
            }
        }
        return res;
    }

    @Override
    public CustomerSeatInfo findByPk(String id) {
        return customerSeatInfoDao.findByPk(id);
    }

    @Override
    public List<CustomerSeatInfo> findAll() {
        return customerSeatInfoDao.findAll();
    }

    @Override
    public void deleteByPk(String id) {
        customerSeatInfoDao.deleteByPk(id);
    }

    @Override
    public void updateUseBeginTime(CustomerSeatInfo customerSeatInfo) {
        customerSeatInfoDao.updateUseBeginTime(customerSeatInfo);
    }

    @Override
    public void updateUseEndTime(CustomerSeatInfo customerSeatInfo) {
        customerSeatInfoDao.updateUseEndTime(customerSeatInfo);
    }
}
