package team.mis.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import team.mis.study.entity.*;
import team.mis.study.service.CustomerFinanceService;
import team.mis.study.service.CustomerSeatInfoService;
import team.mis.study.service.CustomerService;
import team.mis.study.service.SeatService;
import team.mis.study.utils.DateUtil;
import team.mis.study.utils.JsUtil;
import team.mis.study.utils.PriceUtil;
import team.mis.study.vo.SeatOrderView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Time: 2021/9/7 19:42
 * Description: main/seat, main/sign
 */
@Controller
@RequestMapping("main")
public class SeatController {
    @Autowired
    SeatService seatService;

    @Autowired
    CustomerService customerService;

    @Autowired
    CustomerSeatInfoService customerSeatInfoService;

    @Autowired
    CustomerFinanceService customerFinanceService;

    @RequestMapping(value = "/seat", method = RequestMethod.GET)
    public String findSeatInfoByTime1st(HttpServletRequest req) throws ParseException {
        GregorianCalendar calendar = new GregorianCalendar();
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        minute = minute > 30 ? 30 : 0;
        String beginTime = DateUtil.int2Str(hour, minute);
        String endTime = DateUtil.int2Str(hour+1, minute);
        String[] weeks = DateUtil.getCurrent7Days();
        Map<Seat, Boolean> emptyMap = seatService.getEmptySeatMap(weeks[0], beginTime, endTime);

        SeatOrderView seatOrderView = new SeatOrderView();
        seatOrderView.setCurrentDate(weeks[0]);
        seatOrderView.setCurrent7Days(weeks);
        seatOrderView.setCurrentBeginTime(beginTime);
        seatOrderView.setCurrentEndTime(endTime);
        seatOrderView.setEmptyMap(emptyMap);

        req.setAttribute("seatOrderView", seatOrderView);

        return "seatOrder";
    }

    @RequestMapping(value = "/seatFind", method = RequestMethod.POST)
    public String seatFind(@RequestParam("date") String date, // yyyy-MM-dd
                       @RequestParam("beginTime") String beginTime, // HH:mm
                       @RequestParam("endTime") String endTime, // HH:mm
                       @RequestParam("seatId") String seatId,
                       HttpServletRequest req,
                       HttpServletResponse resp,
                       HttpSession session) throws ServletException, IOException, ParseException {
        String[] weeks = DateUtil.getCurrent7Days();
        Map<Seat, Boolean> emptyMap = seatService.getEmptySeatMap(date, beginTime, endTime);

        SeatOrderView seatOrderView = new SeatOrderView();
        seatOrderView.setCurrentDate(date);
        seatOrderView.setCurrent7Days(weeks);
        seatOrderView.setCurrentBeginTime(beginTime);
        seatOrderView.setCurrentEndTime(endTime);
        seatOrderView.setEmptyMap(emptyMap);

        req.setAttribute("seatOrderView", seatOrderView);
        return "seatOrder";
    }

    @RequestMapping(value = "/seatNewOrder", method = RequestMethod.POST)
    public void seatNewOrder(@RequestParam("date") String date, // yyyy-MM-dd
                               @RequestParam("beginTime") String beginTime, // HH:mm
                               @RequestParam("endTime") String endTime, // HH:mm
                               @RequestParam("seatId") String seatId,
                               HttpServletRequest req,
                               HttpServletResponse resp,
                               HttpSession session) throws ParseException, IOException {
        String formatBeginTimeStr = date + " " + beginTime;
        String formatEndTimeStr = date + " " + endTime;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date beginDate = dateFormat.parse(formatBeginTimeStr);
        Date endDate = dateFormat.parse(formatEndTimeStr);

        User user = (User)session.getAttribute("user");
        Customer customer = customerService.findByUser(user);
        double hour = DateUtil.time2hour(beginTime, endTime);
        double cost = PriceUtil.getCost(hour);

        if (cost > customer.getMoney()) {
            JsUtil.print(resp, "alert('您的余额不足，将自动为您跳转到充值界面！');window.location.href='wallet';");
        } else {
            // 更新账户余额
            customer.setMoney(customer.getMoney()-cost);
            customerService.updateMoney(customer);
            // 插入预订信息
            CustomerSeatInfo customerSeatInfo = new CustomerSeatInfo();
            customerSeatInfo.setSeatId(seatId);
            customerSeatInfo.setUserId(user.getUserId());
            customerSeatInfo.setOrderBeginTime(beginDate);
            customerSeatInfo.setOrderEndTime(endDate);
            seatService.addCustomerSeatInfo(customerSeatInfo);
            // 插入用户财务信息变动
            CustomerFinance customerFinance = new CustomerFinance();
            customerFinance.setUserId(user.getUserId());
            customerFinance.setMoney(cost);
            customerFinance.setTime(new Date());
            customerFinance.setJudgeIn(false);
            customerFinance.setNote("预约");
            customerFinanceService.add(customerFinance);
            JsUtil.print(resp, "alert('预约成功！');window.location.href='../main';");
        }
    }

    @RequestMapping(value = "/sign", method = RequestMethod.GET)
    public String toSign(HttpServletRequest req, HttpSession session) {
        User user = (User) session.getAttribute("user");
        //List<CustomerSeatInfo> customerSeatInfoList = customerSeatInfoService.findUnfinishedByUser(user);
        List<CustomerSeatInfo> customerSeatInfoList = customerSeatInfoService.findByUser(user);
        req.setAttribute("customerSeatInfoList", customerSeatInfoList);
        return "mySeat";
    }

    @RequestMapping(value = "/sign/{id}/{judgeIn}", method = RequestMethod.GET)
    public void signInOrOut(@PathVariable("id") String id,
                            @PathVariable("judgeIn") String judgeIn,
                            HttpServletResponse resp) throws IOException {
        CustomerSeatInfo customerSeatInfo = customerSeatInfoService.findByPk(id);
        Date date = new Date();
        if (judgeIn.equals("in")) {
            customerSeatInfo.setUseBeginTime(date);
            customerSeatInfoService.updateUseBeginTime(customerSeatInfo);
            JsUtil.print(resp, "alert('签到成功！');window.location.href='../../sign';");
        } else { // judgeIn.equals("out")
            customerSeatInfo.setUseEndTime(date);
            customerSeatInfoService.updateUseEndTime(customerSeatInfo);
            JsUtil.print(resp, "alert('签离成功！');window.location.href='../../sign';");
        }
    }
}
