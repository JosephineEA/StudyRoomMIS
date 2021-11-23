package team.mis.study.dao;

import team.mis.study.entity.User;

import java.util.List;

/**
 * Time: 2021/9/7 14:28
 * Description: TODO
 */
public interface UserDao {
    void add(User user);

    User findByPk(String username);
}
