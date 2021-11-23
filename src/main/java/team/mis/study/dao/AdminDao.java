package team.mis.study.dao;

import team.mis.study.entity.Admin;

/**
 * Time: 2021/9/10 16:41
 * Description: TODO
 */
public interface AdminDao {
    Admin find(Admin admin); // 如果是find，给了整个对象来find，都是用id来find
}
