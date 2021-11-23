package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/7 18:50
 * Description: TODO
 */
@Data
public class BusinessFinance {
    private String id;
    private Integer money;
    private Date time;
    private boolean judgeIn; // 进账或出账
    private String userId; // 冤大头id
    private String note; // 备注：来源或去向
}
