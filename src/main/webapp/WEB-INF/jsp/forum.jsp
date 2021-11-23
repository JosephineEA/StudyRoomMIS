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
    background-image:url(../image/bodybg.jpg);
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
	.footer	ul{
            list-style-type: none;
		}
	.footer li{
		padding: 2px 4px;
			display: inline-block;
		}
	.footer a{
			display: block;
      color: #fff;
			text-decoration: none;
			font-size: 17px;
    }
  .discuss{
    background-color: #fff;
    opacity: 0.95;
    display: inline-block;
    width: 100%;
  }
  dd a{
    color: #fff;
  }
	</style>
</head>
<body>
	<div class="header">
<ul>
	<span style="font-size: 14px;color: #fff">欢迎您，</span>
	<li><a class="active" href="#">${name}</a></li>
  <li><a href="#">个人空间</a></li>
</ul>
    </div>
    <div class="hh">
    	<img src="../image/bbs图标.png" height="100">
    </div>

    <div class="left">

    	<ul>
    		<li><a href="../main">返回主页</a></li>
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
              <a href="forum/${posting.id}" title="${posting.title}">${posting.title}</a>
            </td>
            <td class="tc">${posting.userId}</td>
            <td class="tc"><span class="time">${posting.time}</span></td>
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
  <div class="discuss">
    <form accept-charset="UTF-8" action="forum" class="publish" id="new_topic" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="6">
          <colgroup><col width="140"><col></colgroup>
          <tbody>
<!-- ---------------------------------------------->
      <tr>
        <th style="color:green">文章标题</th>
        <td>
          <label>
            <input  required id="topic_title" maxlength="80" name="title" size="60" type="text">
          </label>
        </td>
      </tr><br>
<!------------------------------------------------->
      <tr><th valign="top" style="color:green">文章内容</th>
        <td>
          <div class="body_count">
            <textarea cols="62" rows="5" name="content"></textarea>
          </div>
        </td>
      </tr>
<!------------------------------------------------->   
      <tr><th>&nbsp;</th>
        <td>  
            <input type="file" name="file" disabled>
            <button type="reset">重置</button>
            <button type="submit">发表帖子</button>
        </td>
      </tr>
<!------------------------------------------------->
      </tbody></table>
    </form><hr></div>
<!------------------------------------------------->
    <footer style="float: left;">
    	<hr/>
    	<dd class="foot_contact" style="color:#fff">
    		<a href="javascript:void(0)" target="_blank" class="qq qqcustomer_s" disabled="disabled">网站客服</a>
    		<span class="interval">|</span>
    		<a href="javascript:void(0)" target="_blank" class="weixin" disabled="disabled">微信客服</a>
    		<span class="interval">|</span>
    		<a href="javascript:void(0)" target="_blank" class="weibo" disabled="disabled">微博客服</a>
    		<span class="interval">|</span>
    		<a href="https://www.csu.edu.cn/" target="_blank" class="email" title="联系邮箱">www.csu.edu</a>
    		<span class="interval">|</span>
    		<span class="phone" title="服务热线">4000-823-823</span>
    		<span class="interval">|</span>
    		<span>中南大学23小组 版权所有</span> <!-- 23333333333333 -->
    	</dd>
    </footer>
</body>
</html>