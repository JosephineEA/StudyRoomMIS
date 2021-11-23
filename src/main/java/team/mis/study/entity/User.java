package team.mis.study.entity;

import lombok.Data;

/**
 * Time: 2021/9/7 14:27
 * Description: TODO
 */
@Data
public class User { // 暂时为管理员和用户共用
    private String userId;
    private String password;
}
