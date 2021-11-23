package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/10 11:00
 * Description: TODO
 */
@Data
public class Posting {
    String id;
    String userId;
    String title;
    String content;
    Date time;
}
