package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.UserDao;
import team.mis.study.entity.User;
import team.mis.study.service.UserService;

import java.util.List;

/**
 * Time: 2021/9/7 14:34
 * Description: TODO
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        userDao.add(user);
    }

    @Override
    public User findUser(User user) {
        return userDao.findByPk(user.getUserId());
    }
}
