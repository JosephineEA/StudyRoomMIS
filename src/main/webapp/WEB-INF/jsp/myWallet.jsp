<jsp:useBean id="money" scope="request" type="java.lang.Double"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的钱包</title>
    <style>
    * {
        margin: 0;
        padding: 0;
    }
    body{
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
    .box{
        width: 300px;
        height: 300px;
        position: relative;
        background-color: #fff;
        opacity: 0.9;
        margin: 0 auto;
        text-align: center;
        /* 父元素设置 */
    }
    span a{
        width: 100px;
        text-decoration: none;
        line-height: 40px;
        color: white;
        font-weight: bold;
        display: inline-block;
    }
    span a:hover{
        color: #fff;
        background-color: orange;
    }
    span{
        width: 100px;
        height: 40px;
        border: 5px black;
        background-color: #fff;
    }
    .records{
        background: green;
        position: absolute;
        left:30px;
    }
    .invest{
        background-color: green;
        position: absolute;
        right:30px;
    }
    .title{
        color: green;
        font-size: 18px;
        font-weight: bold;
    }
    </style>
</head>
<body>
        <div class="top">
                <p>我的钱包</p>
            </div>
    <div class="box">
            <br><br><span class="title">我的余额:</span>${money}<br><br><br><br><br>
            <span class="records"><a href="wallet/record">流水记录查询</a></span>
            <span class="invest"><a href="wallet/recharge">账户充值</a></span>
    </div>
        <div style="text-align: center;"><a href="../main"><button>返回</button></a><center>
</body>
</html>