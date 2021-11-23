package team.mis.study.entity;

import lombok.Data;

/**
 * Time: 2021/9/7 18:58
 * Description: TODO
 */
@Data
public class Room {
    private String id;
    private String name;
    private String note; // 备注
    private String type;
}
