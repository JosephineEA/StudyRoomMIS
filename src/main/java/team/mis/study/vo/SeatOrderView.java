package team.mis.study.vo;

import lombok.Data;
import team.mis.study.entity.Seat;

import java.util.Map;

/**
 * Time: 2021/9/9 8:50
 * Description: TODO
 */
@Data
public class SeatOrderView {
    private String currentDate;
    private String currentBeginTime;
    private String currentEndTime;
    private String[] current7Days;
    private Map<Seat, Boolean> emptyMap;
}
