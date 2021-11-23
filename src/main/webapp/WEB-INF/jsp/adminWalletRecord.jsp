<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>财务信息查询</title>
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
        <caption><h3>自习室财务信息</h3></caption>
        <thead>
            <th>财务信息编号</th>
            <th>消费金额</th>
            <th>记录时间</th>
            <th>账目类别（进/出）</th>
            <th>关联用户编号</th>
            <th>备注（来源/去向）</th>
        </thead>
        <tbody>
        <jsp:useBean id="businessFinanceList" scope="request" type="java.util.List<team.mis.study.entity.BusinessFinance>"/>
        <c:forEach var="businessFinance" items="${businessFinanceList}">
            <tr>
                <td>${businessFinance.id}</td>
                <td>${businessFinance.money}</td>
                <td>${businessFinance.time}</td>
                <td>
                    <c:if test="${businessFinance.judgeIn == true}">
                        进
                    </c:if>
                    <c:if test="${businessFinance.judgeIn == false}">
                        出
                    </c:if>
                </td>
                <td>${businessFinance.userId}</td>
                <td>${businessFinance.note}</td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <!--<tr>
                <th>总盈亏：</th>
                <td colspan="4"></td>
            </tr>-->
        </tfoot>
    </table>
</div>
    <div style="text-align: center;"><a href="../main"><button>返回</button></a><center>
</body>
</html>