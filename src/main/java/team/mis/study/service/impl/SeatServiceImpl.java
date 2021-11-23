package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.CustomerSeatInfoDao;
import team.mis.study.dao.SeatDao;
import team.mis.study.entity.CustomerSeatInfo;
import team.mis.study.entity.Seat;
import team.mis.study.service.SeatService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.Timestamp;

/**
 * Time: 2021/9/8 16:11
 * Description: TODO
 */
@Service
public class SeatServiceImpl implements SeatService {
    @Autowired
    SeatDao seatDao;

    @Autowired
    CustomerSeatInfoDao customerSeatInfoDao;

    @Override
    public List<Seat> getOccupiedSeatFromBeginToEnd(String beginTime, String endTime) throws ParseException {
        // 1.订单的beginTime在选定的beginTime以前
        //      若订单的endTime在选定的beginTime以后，则违规 - 前半段重叠
        // 2.订单的endTime在选定的beginTime以后
        //      若订单的beginTime在选定的endTime以前，则违规 - 后半段重叠
        Map<String, Object> params = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date beginTimeDate1 = sdf.parse(beginTime);
        Date endTimeDate1 = sdf.parse(endTime);
        Timestamp beginTimeDate = new Timestamp(beginTimeDate1.getTime());
        Timestamp endTimeDate = new Timestamp(endTimeDate1.getTime());

        params.put("beginTime", beginTimeDate);
        params.put("endTime", endTimeDate);
        return seatDao.getOccupiedSeatFromBeginToEnd(beginTime, endTime);
    }

    @Override
    public List<Seat> getAllSeats() {
        return seatDao.findAll();
    }

    @Override
    public Map<Seat, Boolean> getSeatEmptyFlags(List<Seat> occupiedSeat, List<Seat> allSeat) {
        Map<Seat, Boolean> map = new HashMap<>();
        for (Seat s : allSeat) {
            map.put(s, true);
        }
        for (Seat s : occupiedSeat) {
            map.put(s, false);
        }
        return map;
    }

    @Override
    public void addCustomerSeatInfo(CustomerSeatInfo customerSeatInfo) {
        customerSeatInfoDao.add(customerSeatInfo);
    }

    @Override
    public Map<Seat, Boolean> getEmptySeatMap(String date, String beginTime, String endTime) throws ParseException {
        String formatBeginTime = date + " " + beginTime;
        String formatEndTime = date + " " + endTime;
        List<Seat> occupiedSeats = getOccupiedSeatFromBeginToEnd(formatBeginTime, formatEndTime);
        List<Seat> allSeats = getAllSeats();
        return getSeatEmptyFlags(occupiedSeats, allSeats);
    }
}