<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="postAndReplyView" scope="request" type="team.mis.study.vo.PostAndReplyView"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>内容详情</title>
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
	.nav th{
		padding: 10px 0px;
    background: green;
    color: white;
    }
    .nav a{
        height: 30px;
        line-height: 30px;
        width: 50px;
        float: left;
        border:3px solid green;
        text-decoration: none;
        color:green;
        background-color: #fff;
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
    .reply{
      background-color: #fff;
      opacity: 0.95;
      display: inline-block;
      width: 100%;
    }
    dd a{
      color: #fff;
    }
    .stance td{
      text-align: center;
      border: 1px solid #b1b1b1b1;
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
    	<img src="../../image/bbs图标.png" height="100">
    </div>
    <div class="left">
<table width="1000" border="0" cellpadding="0" cellspacing="0" class="table_list parent_forum ">
    <tbody><tr class="nav">
      <th><a href="../forum">返回</a></th>
      <th width="500px">标题：${postAndReplyView.posting.title}</th>
      <th class="tc">发帖人：${postAndReplyView.posting.userId}</th>
      <th class="tc">发帖时间：${postAndReplyView.posting.time}</th>
    </tr>
    <tr>
    <td colspan="4" style="text-indent:2em;">${postAndReplyView.posting.content}</td>

        <c:forEach var="replying" items="${postAndReplyView.replyingList}">
    </tr>
    <tr class="stance">
      <td style="text-align: center;">回复id：${replying.id}</td>
      <td style="border: 1px solid #b1b1b1;">${replying.content}
      <td>用户名：${replying.userId}</td>
      <td>回复时间：${replying.time}</td>
      </td>
    </tr>
    </c:forEach>

  </tbody></table>
    </div>
<div class="reply">
    <form accept-charset="UTF-8" action="" class="reply" id="reply" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="6">
          <colgroup><col width="140"><col></colgroup>
          <tbody>
<!-- ---------------------------------------------->
      <tr><th valign="top" style="color:green">回复内容</th>
        <td>
          <div class="body_count">
            <textarea required cols="62" rows="5" name="content"></textarea>
          </div>
        </td>
      </tr>
<!------------------------------------------------->   
      <tr><th>&nbsp;</th>
        <td>  
            <button type="reset">重置</button>
            <button type="submit">提交</button>
        </td>
      </tr>
<!------------------------------------------------->
      </tbody></table>
    </form><hr></div>
<!------------------------------------------------->
    <footer style="float: left;">
    	<hr/>
    	<dd class="foot_contact" style="color:#fff">
    		<a href="javascript:void(0)" target="_blank" class="qq qqcustomer_s">网站客服</a>
    		<span class="interval">|</span>
    		<a href="javascript:void(0)" target="_blank" class="weixin">微信客服</a>
    		<span class="interval">|</span>
    		<a href="javascript:void(0)" target="_blank" class="weibo">微博客服</a>
    		<span class="interval">|</span>
    		<a href="https://www.csu.edu.cn/" target="_blank" class="email" title="联系邮箱">www.csu.edu</a>
    		<span class="interval">|</span>
    		<span class="phone" title="服务热线">100-100-0100</span>
    		<span class="interval">|</span>
    		<span>中南大学23小组 版权所有</span>
    	</dd>
    </footer>
</body>
</html>