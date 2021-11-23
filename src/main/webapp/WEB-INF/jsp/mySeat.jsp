<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>座位查询</title>
        </head>
        <style>
            body {
                background-image: url(../image/bodybg.jpg);

            }

            .info {
                margin: 0 auto;
                width: 1080px;
                background-color: #fff;
                opacity: 0.9;
            }

            table {
                position: relative;
                margin: auto auto 50px;
            }

            .check-in {
                float: left;
            }

            .check-out {
                float: right;
            }

            .cancel {
                float: right;
            }
        </style>

        <body>
            <div class="info">
                <table border="1">
                    <caption>
                        <h3>我的座位</h3>
                    </caption>
                    <thead>
                        <th>座位编号</th>
                        <th>预约开始时间</th>
                        <th>预约结束时间</th>
                        <th>使用开始时间</th>
                        <th>使用结束时间</th>
                        <th>签到</th>
                        <th>签离</th>
                        <th>取消预约</th>
                    </thead>
                    <tbody>
                        <jsp:useBean id="customerSeatInfoList" scope="request"
                            type="java.util.List<team.mis.study.entity.CustomerSeatInfo>" />
                        <c:forEach var="customerSeatInfo" items="${customerSeatInfoList}">
                            <tr>
                                <td>${customerSeatInfo.seatId}</td>
                                <td>${customerSeatInfo.orderBeginTime}</td>
                                <td>${customerSeatInfo.orderEndTime}</td>
                                <td>${customerSeatInfo.useBeginTime}</td>
                                <td>${customerSeatInfo.useEndTime}</td>
                                <td>
                                    <div class="check-in">
                                        <a href="sign/${customerSeatInfo.id}/in"><input type="button" value="签到"
                                            <c:if test="${customerSeatInfo.useBeginTime != null}"> disabled </c:if>
                                            ></a>
                                    </div>
                                </td>
                                <td>
                                    <div class="check-out">
                                        <a href="sign/${customerSeatInfo.id}/out"><input type="button" value="签离"
                                        <c:if test="${customerSeatInfo.useBeginTime == null || customerSeatInfo.useEndTime != null}"> disabled </c:if>
                                        ></a>
                                    </div>
                                </td>
                                <td>
                                    <div class="cancel"><button type="button" disabled>取消预约</button></div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>

            </div>
            <div style="text-align: center;"><a href="../main"><button>返回</button></a><center>
        </body>

        </html>