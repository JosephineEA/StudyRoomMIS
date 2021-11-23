package team.mis.study.entity;

import lombok.Data;

import java.util.Date;

/**
 * Time: 2021/9/7 19:13
 * Description: TODO
 */
@Data
public class CustomerSeatInfo {
    private String id;
    private String userId;
    private String seatId;
    private Date orderBeginTime;
    private Date orderEndTime;
    private Date useBeginTime;
    private Date useEndTime;
}
