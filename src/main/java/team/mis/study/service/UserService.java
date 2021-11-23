package team.mis.study.service;

import team.mis.study.entity.User;

import java.util.List;

/**
 * Time: 2021/9/7 14:33
 * Description: TODO
 */
public interface UserService {
    void addUser(User user);

    User findUser(User user);
}
