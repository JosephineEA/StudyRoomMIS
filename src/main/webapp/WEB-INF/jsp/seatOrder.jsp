<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="seatOrderView" scope="request" type="team.mis.study.vo.SeatOrderView"/>
<%--
  Created by IntelliJ IDEA.
  User: Catigeart
  Date: 2021/9/9
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>座位订单信息</title>

    <style>
    body{
        margin: 0;
        background-image: url(../image/bodybg.jpg);
    }
    .top {
        width: 100%;
        height: 3rem;
        background-color: green;
        text-align: center;
    }
    .top p {
        width: 100%;
        font-size: 2rem;
        font-weight: bold;
        color: #fff;
    }
    span{
        color: green;
        font-size: 18px;
    }
    .box{
        width: 420px;
        height: 300px;
        /* position: relative; */
        background-color: #fff;
        opacity: 0.9;
        margin: 0 auto;
        padding: 3%;
    }
    option{
        height: 20px;
    }
    </style>
</head>
<body>
    <div class="top">
        <p>座位订单信息</p>
    </div>
<div class="box">
<form name="seatForm" method="post">
    <input type="hidden" name="action" value="edit">
    <label>
        <span>日&emsp;&emsp;期</span>
        <select name="date">
            <option value="${seatOrderView.current7Days[0]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[0])){ %> selected <% } %> >${seatOrderView.current7Days[0]}</option>
            <option value="${seatOrderView.current7Days[1]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[1])){ %> selected <% } %> >${seatOrderView.current7Days[1]}</option>
            <option value="${seatOrderView.current7Days[2]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[2])){ %> selected <% } %> >${seatOrderView.current7Days[2]}</option>
            <option value="${seatOrderView.current7Days[3]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[3])){ %> selected <% } %> >${seatOrderView.current7Days[3]}</option>
            <option value="${seatOrderView.current7Days[4]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[4])){ %> selected <% } %> >${seatOrderView.current7Days[4]}</option>
            <option value="${seatOrderView.current7Days[5]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[5])){ %> selected <% } %> >${seatOrderView.current7Days[5]}</option>
            <option value="${seatOrderView.current7Days[6]}"<% if(seatOrderView.getCurrentDate().equals(seatOrderView.getCurrent7Days()[6])){ %> selected <% } %> >${seatOrderView.current7Days[6]}</option>
        </select>
    </label>
<br><br>
    <label>
        <span>开始时间</span>
        <select name="beginTime">
            <option value="08:00"<% if(seatOrderView.getCurrentBeginTime().equals("08:00")){ %> selected <% } %> >08:00</option>
            <option value="08:30"<% if(seatOrderView.getCurrentBeginTime().equals("08:30")){ %> selected <% } %> >08:30</option>
            <option value="09:00"<% if(seatOrderView.getCurrentBeginTime().equals("09:00")){ %> selected <% } %> >09:00</option>
            <option value="09:30"<% if(seatOrderView.getCurrentBeginTime().equals("09:30")){ %> selected <% } %> >09:30</option>
            <option value="10:00"<% if(seatOrderView.getCurrentBeginTime().equals("10:00")){ %> selected <% } %> >10:00</option>
            <option value="10:30"<% if(seatOrderView.getCurrentBeginTime().equals("10:30")){ %> selected <% } %> >10:30</option>
            <option value="11:00"<% if(seatOrderView.getCurrentBeginTime().equals("11:00")){ %> selected <% } %> >11:00</option>
            <option value="11:30"<% if(seatOrderView.getCurrentBeginTime().equals("11:30")){ %> selected <% } %> >11:30</option>
            <option value="12:00"<% if(seatOrderView.getCurrentBeginTime().equals("12:00")){ %> selected <% } %> >12:00</option>
            <option value="12:30"<% if(seatOrderView.getCurrentBeginTime().equals("12:30")){ %> selected <% } %> >12:30</option>
            <option value="13:00"<% if(seatOrderView.getCurrentBeginTime().equals("13:00")){ %> selected <% } %> >13:00</option>
            <option value="13:30"<% if(seatOrderView.getCurrentBeginTime().equals("13:30")){ %> selected <% } %> >13:30</option>
            <option value="14:00"<% if(seatOrderView.getCurrentBeginTime().equals("14:00")){ %> selected <% } %> >14:00</option>
            <option value="14:30"<% if(seatOrderView.getCurrentBeginTime().equals("14:30")){ %> selected <% } %> >14:30</option>
            <option value="15:00"<% if(seatOrderView.getCurrentBeginTime().equals("15:00")){ %> selected <% } %> >15:00</option>
            <option value="15:30"<% if(seatOrderView.getCurrentBeginTime().equals("15:30")){ %> selected <% } %> >15:30</option>
            <option value="16:00"<% if(seatOrderView.getCurrentBeginTime().equals("16:00")){ %> selected <% } %> >16:00</option>
            <option value="16:30"<% if(seatOrderView.getCurrentBeginTime().equals("16:30")){ %> selected <% } %> >16:30</option>
            <option value="17:00"<% if(seatOrderView.getCurrentBeginTime().equals("17:00")){ %> selected <% } %> >17:00</option>
            <option value="17:30"<% if(seatOrderView.getCurrentBeginTime().equals("17:30")){ %> selected <% } %> >17:30</option>
            <option value="18:00"<% if(seatOrderView.getCurrentBeginTime().equals("18:00")){ %> selected <% } %> >18:00</option>
            <option value="18:30"<% if(seatOrderView.getCurrentBeginTime().equals("18:30")){ %> selected <% } %> >18:30</option>
            <option value="19:00"<% if(seatOrderView.getCurrentBeginTime().equals("19:00")){ %> selected <% } %> >19:00</option>
            <option value="19:30"<% if(seatOrderView.getCurrentBeginTime().equals("19:30")){ %> selected <% } %> >19:30</option>
            <option value="20:00"<% if(seatOrderView.getCurrentBeginTime().equals("20:00")){ %> selected <% } %> >20:00</option>
            <!--
            <option value="20:30"<% if(seatOrderView.getCurrentBeginTime().equals("20:30")){ %> selected <% } %> >20:30</option>
            -->
        </select>
    </label>
<br><br>
    <label>
        <span>结束时间</span>
        <select name="endTime">
            <!--
            <option value="08:30"<% if(seatOrderView.getCurrentEndTime().equals("08:30")){ %> selected <% } %> >08:30</option>
            -->
            <option value="09:00"<% if(seatOrderView.getCurrentEndTime().equals("09:00")){ %> selected <% } %> >09:00</option>
            <option value="09:30"<% if(seatOrderView.getCurrentEndTime().equals("09:30")){ %> selected <% } %> >09:30</option>
            <option value="10:00"<% if(seatOrderView.getCurrentEndTime().equals("10:00")){ %> selected <% } %> >10:00</option>
            <option value="10:30"<% if(seatOrderView.getCurrentEndTime().equals("10:30")){ %> selected <% } %> >10:30</option>
            <option value="11:00"<% if(seatOrderView.getCurrentEndTime().equals("11:00")){ %> selected <% } %> >11:00</option>
            <option value="11:30"<% if(seatOrderView.getCurrentEndTime().equals("11:30")){ %> selected <% } %> >11:30</option>
            <option value="12:00"<% if(seatOrderView.getCurrentEndTime().equals("12:00")){ %> selected <% } %> >12:00</option>
            <option value="12:30"<% if(seatOrderView.getCurrentEndTime().equals("12:30")){ %> selected <% } %> >12:30</option>
            <option value="13:00"<% if(seatOrderView.getCurrentEndTime().equals("13:00")){ %> selected <% } %> >13:00</option>
            <option value="13:30"<% if(seatOrderView.getCurrentEndTime().equals("13:30")){ %> selected <% } %> >13:30</option>
            <option value="14:00"<% if(seatOrderView.getCurrentEndTime().equals("14:00")){ %> selected <% } %> >14:00</option>
            <option value="14:30"<% if(seatOrderView.getCurrentEndTime().equals("14:30")){ %> selected <% } %> >14:30</option>
            <option value="15:00"<% if(seatOrderView.getCurrentEndTime().equals("15:00")){ %> selected <% } %> >15:00</option>
            <option value="15:30"<% if(seatOrderView.getCurrentEndTime().equals("15:30")){ %> selected <% } %> >15:30</option>
            <option value="16:00"<% if(seatOrderView.getCurrentEndTime().equals("16:00")){ %> selected <% } %> >16:00</option>
            <option value="16:30"<% if(seatOrderView.getCurrentEndTime().equals("16:30")){ %> selected <% } %> >16:30</option>
            <option value="17:00"<% if(seatOrderView.getCurrentEndTime().equals("17:00")){ %> selected <% } %> >17:00</option>
            <option value="17:30"<% if(seatOrderView.getCurrentEndTime().equals("17:30")){ %> selected <% } %> >17:30</option>
            <option value="18:00"<% if(seatOrderView.getCurrentEndTime().equals("18:00")){ %> selected <% } %> >18:00</option>
            <option value="18:30"<% if(seatOrderView.getCurrentEndTime().equals("18:30")){ %> selected <% } %> >18:30</option>
            <option value="19:00"<% if(seatOrderView.getCurrentEndTime().equals("19:00")){ %> selected <% } %> >19:00</option>
            <option value="19:30"<% if(seatOrderView.getCurrentEndTime().equals("19:30")){ %> selected <% } %> >19:30</option>
            <option value="20:00"<% if(seatOrderView.getCurrentEndTime().equals("20:00")){ %> selected <% } %> >20:00</option>
            <option value="20:30"<% if(seatOrderView.getCurrentEndTime().equals("20:30")){ %> selected <% } %> >20:30</option>
            <option value="21:00"<% if(seatOrderView.getCurrentEndTime().equals("21:00")){ %> selected <% } %> >21:00</option>
        </select>
    </label>
<br><br>
    <label>
        <span>选择座位</span>
        <select name="seatId">
            <c:forEach var="map" items="${seatOrderView.emptyMap}">
                <c:set var="seat" value="${map.key}"/>
                <c:set var="isEmpty" value="${map.value}"/>
                <c:if test="${isEmpty == true}">
                    <option value="${seat.id}">${seat}</option>
                </c:if>
            </c:forEach>
        </select>
    </label>
<br><br>
    <input type="button" value="查找座位" onclick="submitFun('seatFind')">
    <input type="button" value="提交预约" onclick="submitFun('seatNewOrder')">
    <!--
    <button type="button" name="toFind" value="true" onclick="submitFun('caonima')">查找座位</button>
    <button type="button" name="toFind" value="false" style="float:right" onclick="submitFun('caoniba')">提交预约</button>
       -->
</form>
    <div style="text-align: center;"><a href="../main"><button>返回</button></a></div>
</div>
    <div style="text-align: center;padding:0.5cm 0.5cm 0.5cm 0.5cm;"><img src="../image/seat.jpg" width="600" alt="座位图" ></div>


    <script type="text/javascript">

        function submitFun(act) {
            document.seatForm.action = act;
            document.seatForm.submit();
        }
    </script>

</body>
</html>
