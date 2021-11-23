<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户信息管理</title>
</head>
<style>
    body{
        background-image: url(../../image/bodybg.jpg);
    }
    div{
        width: 400px;
        background-color: #fff;
        opacity: 0.9;
        margin: 0 auto;
    }
    table{
        position: relative;
        margin: auto auto;
    }
    input.number{
        text-align:center;
        width: 125px;
        padding:10px 20px; 
        font-size: 18px;
        }
</style>
<script>
    function modify(id) {
        const vCnt = document.getElementById("vCnt"+id).value;
        window.location.href="user/"+id+"/"+vCnt;
    }
</script>
<body>
    <div>
    <table border="1" height="600">
        <caption><h3>用户信息管理</h3></caption>
        <thead>
            <th>用户账户</th>
            <th>违约次数</th>
            <th>违约次数修改</th>
        <th>确认修改</th>
        </thead>
        <tbody>
        <jsp:useBean id="customerList" scope="request" type="java.util.List<team.mis.study.entity.Customer>"/>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.userId}</td>
                <td>${customer.violationCount}</td>
                <td><input id="vCnt${customer.userId}" type="number" class="number" name="violationCount"></td>
                <td><input type="button" value="确认修改" onclick="modify(${customer.userId})"></td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <!--
            <tr>
                <th>共计违约次数：</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th>修改确认：</th>
                <td colspan="2"><input type="submit" style="width: 240px;"></td>
            </tr>
            -->
        </tfoot>
    </table>
</div>
    <div style="text-align: center;"><a href="../main"><button>返回</button></a><center>
</body>
</html>