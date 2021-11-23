<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>座位管理</title>
</head>
<style>
    body{
        background-image: url(../../image/bodybg.jpg);
    }
    table{
        position: relative;
        margin: auto auto;
    }
    div{
        width: 800px;
        background-color: #fff;
        opacity: 0.9;
        margin: 0 auto;
    }
</style>
<body>
<div>
    <table border="1" height="600">

        <caption><h3>座位使用记录</h3></caption>
        <thead>
        <th>订单ID</th>
                <th>用户ID</th>
                <th>座位编号</th>
                <th>预约开始时间</th>
                <th>预约结束时间</th>
                <th>使用开始时间</th>
                <th>使用结束时间</th>
                <th>删除</th>
        </thead>
        <tbody>
            <jsp:useBean id="customerSeatInfoList" scope="request" type="java.util.List<team.mis.study.entity.CustomerSeatInfo>"/>
            <c:forEach var="customerSeatInfo" items="${customerSeatInfoList}">
            <tr>
                <td>${customerSeatInfo.id}</td>
                <td>${customerSeatInfo.userId}</td>
                <td>${customerSeatInfo.seatId}</td>
                <td>${customerSeatInfo.orderBeginTime}</td>
                <td>${customerSeatInfo.orderEndTime}</td>
                <td>${customerSeatInfo.useBeginTime}</td>
                <td>${customerSeatInfo.useEndTime}</td>
                <td><a href="seat/${customerSeatInfo.id}"><input type="button" value="删除" style="width: 65px;"></a></td></tr>
            </tr>
            </c:forEach>
        </tbody>

        <!-- <tfoot>
            <tr>
                <th>共计消费：</th>
                <td colspan="3"></td>
            </tr>
        </tfoot> -->
    </table>
    <div style="text-align: center;"><a href="../main"><button>返回</button></a><center>
</div>
</body>
</html>