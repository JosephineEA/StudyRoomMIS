<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<script>
	varinputDate = document.querySelector("#inputDate");
	var changeType = function(){
		this.type = "date";
		console.log(this);
	}
	var removeEvent = function(){
		console.log(this);
		if(this.focus){
			this.removeEventListener("focus",changeType);
			this.removeEventListener("blur",removeEvent)
		}
	}
	inputDate.addEventListener("focus",changeType);
	inputDate.addEventListener("blur",removeEvent);
</script>
<style>
.man{
	float: left;
}
.woman{
	float: right;
	transform: translateX(-350%)
}
.title{
	float: right;
	text-align: center;
}
.title a{
	color: #01cd74;
	font-size: 15px;
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
					
					<p>猫猫自习室将会给每一位用户提供最好的体验。</p>
					
				</div>
			</div>
			<div class="w3_info">
				<h2 style="text-align: center">用户注册</h2><span class="title"><a href="login">已有帐户？登录</a></span>
						<form action="#" method="post">
						<div class="input-group">
							 <input type="text" placeholder="用户账户" required="required" name="userId"> 
						</div>	
						<div class="input-group">
							<input type="password" placeholder="设置密码" required="required" name="password"> 
						</div>
						<div class="input-group">
								<input type="password" placeholder="确认密码" required="required" name="password2"> 
						</div>
						<div class="input-group">
							<input type="text" placeholder="用户名" required="required" name="name"> 
						</div>
						<div class="input-group">
							<span class="man"><input type="radio" name="sex" value="男">男<label for="#sex"></label></span>
							<span class="woman"><input type="radio" name="sex" value="女">女<label for="#sex"></label></span>
							<span class="secret"><input checked type="radio" name="sex" value="保密">保密<label for="#sex"></label></span>
						</div>
						<div class="input-group">
							&nbsp;&nbsp;生日&emsp;&emsp;&emsp; <input type="date" name="birthday">
						</div>
						<div class="input-group">
							<input type="text" placeholder="电话号码" required="required" name="phone">
						</div>
						<div class="input-group">
							<input type="text" placeholder="邮箱" required="required" name="email">
						</div>
						<div class="input-group">
							<input type="text" placeholder="职业" required="required" name="job">
						</div>
							<button class="btn btn-danger btn-block" type="reset">重置</button >       
							<button class="btn btn-danger btn-block" type="submit">注册</button >                
					</form>
			</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">

 <p><a target="_blank" ></a></p>
 </div>
	</div>
	</body>
</html>