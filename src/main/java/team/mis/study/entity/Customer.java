package team.mis.study.entity;

import lombok.Data;

/**
 * Time: 2021/9/7 18:54
 * Description: TODO
 */
@Data
public class Customer {
    private String userId;
    // private User loginInfo;
    private String roomId; // 拥有权限的房间编号
    private Double money;
    private Integer violationCount; // TODO：可以扩展成违规的具体记录列表
}
