<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>流水记录查询</title>
</head>
<style>
    body{
        background-image: url(../../image/bodybg.jpg);
    }
    div{
        width: 600px;
        background-color: #fff;
        opacity: 0.9;
        margin: 0 auto;
    }
    table{
        position: relative;
        margin: auto auto;
    }
</style>
<body>
    <div>
    <table border="1" height="600">
        <caption><h3>流水记录查询</h3></caption>
        <thead>
            <th>账单编号</th>
            <th>记录时间</th>
            <th>消费金额</th>
            <th>账目类别（进账/出账）</th>
            <th>备注</th>
        </thead>
        <tbody>
        <jsp:useBean id="customerFinanceList" scope="request" type="java.util.List<team.mis.study.entity.CustomerFinance>"/>
        <c:forEach var="customerFinance" items="${customerFinanceList}">
            <tr>
                <td>${customerFinance.id}</td>
                <td>${customerFinance.time}</td>
                <td>${customerFinance.money}</td>
                <td><c:if test="${customerFinance.judgeIn == true}">进账</c:if>
                    <c:if test="${customerFinance.judgeIn == false}">出账</c:if>
                </td>
                <td>${customerFinance.note}</td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <!--
            <tr>
                <th>共计消费：</th>
                <td colspan="3"></td>
            </tr>
            -->
        </tfoot>
    </table>
</div>

    <div style="text-align: center;"><a href="../wallet"><button>返回</button></a><center>
</body>
</html>