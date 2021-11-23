package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/7 19:00
 * Description: TODO
 */
@Data
public class CustomerPersonal {
    private String userId;
    private String name;
    private Date birthday;
    private String sex;
    private String job;
    private String phone;
    private String email;
}
