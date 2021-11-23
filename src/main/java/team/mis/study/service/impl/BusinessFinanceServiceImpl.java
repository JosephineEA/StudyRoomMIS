package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.BusinessFinanceDao;
import team.mis.study.entity.BusinessFinance;
import team.mis.study.service.BusinessFinanceService;

import java.util.List;

/**
 * Time: 2021/9/11 19:32
 * Description: TODO
 */
@Service
public class BusinessFinanceServiceImpl implements BusinessFinanceService {
    @Autowired
    BusinessFinanceDao businessFinanceDao;

    @Override
    public List<BusinessFinance> findAll() {
        return businessFinanceDao.findAll();
    }
}
