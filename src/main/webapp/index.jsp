<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style>
.admin{
	float: right;
}
a{	
	line-height: 5px;
	color: #01cd74;
	vertical-align: middle;
}
.ac{
	float: left;
}
.rg{
	float: right;
}
</style>
</head>
<body>
<div class="signupform">
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>欢迎您！</h3>
					
					<p> 来到我们的猫咪自习室!</p>
					
				</div>
			</div>
			<div class="w3_info">
				<h2>用户登录</h2><span class="admin"><a href="admin/login">管理员入口</a></span>
						<form action="login" method="post">
						<div class="input-group">
							<input type="text" placeholder="用户账户" required="required" name="userId"> 
						</div>
						<div class="input-group">	
							<input type="password" placeholder="密码" required="required" name="password"> 
						</div>
							<span class="rm"></span><input type="checkbox" value="remember-me" /><h4>点击我，记住密码 </h4></span>
							<span class="rg"><h4> 没有账号？</h4><a href="register" >请注册</a></span><br>
							<button class="btn btn-danger btn-block" type="submit">登录</button >                
					</form>
			</div>
				<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
			<p><a target="_blank"></a></p>
 		</div>
	</div>
	</body>
</html>