package team.mis.study.service;

import team.mis.study.entity.CustomerSeatInfo;
import team.mis.study.entity.Seat;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Time: 2021/9/8 16:09
 * Description: TODO
 */
public interface SeatService {
    List<Seat> getOccupiedSeatFromBeginToEnd(String beginTime, String endTime) throws ParseException;

    List<Seat> getAllSeats();

    Map<Seat, Boolean> getSeatEmptyFlags(List<Seat> occupiedSeat, List<Seat> allSeat);

    void addCustomerSeatInfo(CustomerSeatInfo customerSeatInfo);

    Map<Seat, Boolean> getEmptySeatMap(String date, String beginTime, String endTime) throws ParseException;
}
