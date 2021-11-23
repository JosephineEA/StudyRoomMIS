package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/10 11:01
 * Description: TODO
 */
@Data
public class Replying {
    String id;
    String postingId;
    String userId;
    String content;
    Date time;
}
