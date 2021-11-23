package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/7 19:04
 * Description: TODO
 */
@Data
public class CustomerFinance {
    private String id;
    private String userId;
    private Double money;
    private Date time;
    private boolean judgeIn; // 进账或出账
    private String note; // 备注
}
