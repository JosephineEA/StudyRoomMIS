<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>猫咪论坛</title>
	<style type="text/css">
	body,html{
            margin:0;
            padding:0;
            width: 1000px;
        }
  body{
    background-image:url(../../image/bodybg.jpg);
  }
	.header	ul{
            float: right;
            list-style-type: none;
            margin: 0;
            padding: 0;
		}
	.header li{
			display: inline-block;
		}
	.header a{
			display: inline-block;
			color: rgb(253, 253, 253);
			text-decoration: none;
			font-size: 14px;
		}
	.hh{
		    top: 30px;
            height: 100px;
		}
		.left{
      /* height: 676px; */
			width: 100%;
			border: 1px solid #ccc;
			float: left;
      background-color: #fff;
      opacity: 0.95;
		}
		.left ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #eaebec;
}
.left li {
    display: inline-block;
    border-right:1px solid #bbb;
}
.left li a {
    display: block;
    color: #4f4f4f;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.left li a:hover:not(.active) {
    background-color: #ddd;
}
		.time{
			font-size: 16px;
		}
		.title a{
    text-decoration: none;
    }
    .tc{
      text-align: left;
    }
		.tc a{
    text-decoration: none;
		}
	.zebra th{
		padding: 10px 0px;
    background: green;
    color: white;
  }
	</style>
</head>
<body>
	<div class="header">
<ul>
	<span style="font-size: 14px;color: #fff">欢迎您，</span>
	<li><a class="active" href="#">${username}</a></li>
  <li><a href="#" disabled="disabled">管理员</a></li>
</ul>
    </div>
    <div class="hh">
    	<img src="../../image/bbs图标.png" height="100">
    </div>
    <div class="left">
    	<ul>
    		<li><a href="../main" disabled="disabled">返回主页</a></li>
            <!--
    		<input type="date" name="">
    		<button type="submit" disabled><span>查找</span></button>
    		-->
    	</ul>

<table width="1000" border="0" cellpadding="0" cellspacing="0" class="table_list parent_forum ">
    <tbody><tr class="title">
      <th width="600px">标题</th>
      <th class="tc">发帖人</th>
      <th class="tc">发帖时间</th>
      <th class="tc">帖子管理</th>
    </tr>
    <jsp:useBean id="postingList" scope="request" type="java.util.List<team.mis.study.entity.Posting>"/>
    <c:forEach var="posting" items="${postingList}" varStatus="status">
        <tr style="height:40px">

            <td class="zebra">
                <strong <c:if test="${status.index%2==0}"> class="green" </c:if>
                        <c:if test="${status.index%2!=0}"> class="red" </c:if>
                    ${posting.id}
                >
                </strong>
                <!--<textarea href="forum/${posting.id}" title="${posting.title}">${posting.title}</textarea>-->
                ${posting.title}
            </td>
            <td class="tc">${posting.userId}</td>
            <td class="tc"><span class="time">${posting.time}</span></td>
            <td class="tc"><span><a href="forum/${posting.id}"><button>删除</button></a></span></td>
        </tr>
    </c:forEach>
  </tbody></table>
<!--
<nav aria-label="Page navigation" style="float: right;">
  <ul class="pagination">
    <li>
      <a href="javasrcipt:;" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="javasrcipt:;">1</a></li>
    <li><a href="javasrcipt:;">2</a></li>
    <li><a href="javasrcipt:;">3</a></li>
    <li><a href="javasrcipt:;">4</a></li>
    <li><a href="javasrcipt:;">5</a></li>
    <li>
      <a href="javasrcipt:;" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
        -->
    </div>
</body>
</html>