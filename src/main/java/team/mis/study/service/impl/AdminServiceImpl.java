package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.AdminDao;
import team.mis.study.entity.Admin;
import team.mis.study.service.AdminService;

/**
 * Time: 2021/9/10 16:40
 * Description: TODO
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin find(Admin admin) {
        return adminDao.find(admin);
    }
}
