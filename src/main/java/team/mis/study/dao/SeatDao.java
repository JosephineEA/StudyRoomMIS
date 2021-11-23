package team.mis.study.dao;

import org.apache.ibatis.annotations.Param;
import team.mis.study.entity.Seat;

import java.util.List;
import java.util.Map;

/**
 * Time: 2021/9/8 17:58
 * Description: TODO
 */
public interface SeatDao {
    //List<Seat> getOccupiedSeatFromBeginToEnd(Map<String, Object> params);

    List<Seat> getOccupiedSeatFromBeginToEnd(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    List<Seat> findAll();
}
