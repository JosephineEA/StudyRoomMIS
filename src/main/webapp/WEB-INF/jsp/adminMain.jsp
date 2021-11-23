<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>管理员后台</title>
	<script src="../js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".li1").click(function(){
				$(".ul1").slideToggle("fast");
			});
		});
		$(document).ready(function(){
			$(".li2").click(function(){
				$(".ul2").slideToggle("fast");
			});
		});
		$(document).ready(function(){
			$(".li3").click(function(){
				$(".ul3").slideToggle("fast");
			});
		});
		$(document).ready(function(){
			$(".li4").click(function(){
				$(".ul4").slideToggle("fast");
			});
		});
		function funp(){
			//window.location.href('main/user');
			window.open ('main/user','newwindow','height=800,width=800,top=500,left=350,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
			}
		function funs(){
			window.location.href('main/seat');
		//window.open ('main/seat','newwindow','height=800,width=800,top=500,left=350,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		}
		function funt(){
			window.location.href('main/forum');
		//window.open ('main/forum','newwindow','height=800,width=1000,top=500,left=350,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		}
		function func(){
			window.location.href('main/wallet');
		//window.open ('main/wallet','newwindow','height=800,width=1000,top=500,left=350,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		}
	</script>
	<style type="text/css">
	.header{
    height: 70px;
    line-height: 10px;
    border: 1px solid #ccc;
    
	}
	.header h2{
	float: left;
	font-size: 22px;
    padding-left: 80px
	}
	.index_header{
		   float: right;
    margin-right: 50px;
	}
	.index_header a{
    width: 50px;
    height: 28px;
    display: inline-block;
    border: 1px solid #679e43;
    background: green;
    line-height: 28px;
    text-align: center;
    border-radius: 4px;
    font-weight: bold;
    font-size: 15px;
    color: #fff;
    text-decoration: none;
		}
	.index_header p{
			display: inline-block;
		}
	body,html{
            margin:0;
            padding:0;
        }
    .left_body{
        	height: 545px;
        	background:#f1f1f1;
        	float: left;
        }
   .left_body ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}

.left_body li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

.left_body li a.active {
    background-color: #4CAF50;
    color: white;
}

.left_body li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
.right_body{
		height: 545px;
		width: 100%;
		background-image: url(../image/bg1.png);
		background-size: 40%;
		background-repeat:no-repeat;
		background-position: right;
	}
	</style>
</head>
<body>
<div class="header">
	<h1 style="float: left;color: black"><br>后台管理系统</h1>
	<div class="index_header">
		<p>
			<span style="color:green">欢迎您！</span>
		</p>
		<a href="logout">退出</a>
	</div>
</div>
<div class="left_body">
	<nav>
	<ul>
		<li><a class="active">功能列表</a></li>
		<li class="li1"><a href="javascript:;" style="background-color: #99CCFFed;">用户管理</a></li>
		<ul class="ul1" style="display: none">
			<li><a href="main/user"><p>管理用户违约次数</p></a>
			<!--
			  <li><a href="javascript:;"><p onclick="funp()" >管理用户信息</p></a></li>
			  <li><a href="javascript:;"><p onclick="funp()" >查询用户</p></a></li>
			  -->
		</ul>
		<li class="li2"><a href="javascript:;" style="background-color: #99CCFFed;">座位管理</a></li>
		<ul class="ul2" style="display: none">
			<li><a href="main/seat"><p>管理座位预约情况</p></a>
			<!--
			  <li><a href="javascript:;"><p onclick="funs()" >管理座位信息</p></a></li>
			  <li><a href="javascript:;"><p onclick="funs()" >查询座位</p></a></li>
			-->
		</ul>
		<li class="li3"><a href="javascript:;" style="background-color: #99CCFFed;">论坛管理</a></li>
		<ul class="ul3" style="display: none">
			<li><a href="main/forum"><p>删除帖子</p></a>
		  	<!-- <li><a href="javascript:;"><p onclick="funt()" >删除帖子</p></a></li> -->
		</ul>
		 <li class="li4"><a href="javascript:;" style="background-color: #99CCFFed;">财务管理</a></li>
		 <ul class="ul4" style="display: none">
				<!-- <li><a href="javascript:;"><p onclick="func()" >财务信息查询</p></a></li> -->
			 <li><a href="main/wallet"><p>财务信息查询</p></a>
		</ul>
	</nav>
</div>
<div class="right_body">
	<h2>欢迎您!</h2>
	
</div>
</body>
</html>