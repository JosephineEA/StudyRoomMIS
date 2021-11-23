<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

html{
    width: 100%;
    height: 100%;
    overflow: hidden;
    font-style: sans-serif;
}
body{
    width: 100%;
    height: 100%;
    font-family: 'Open Sans',sans-serif;
    margin: 0;
    background-image: url(../image/bodybg.jpg);
}
#login{
    position: absolute;
    top: 40%;
    left:50%;
    margin: -150px 0 0 -150px;
    width: 300px;
    height: 300px;
}
#login h3{
    text-align: center;
}
h1{
    font-size: 2em;
    margin: 0.67em 0;
}
input{
    width: 278px;
    height: 18px;
    margin-bottom: 10px;
    outline: none;
    padding: 10px;
    font-size: 16px;
    color: #fff;
    text-shadow:1px 1px 1px grey;
    border-top: 1px solid #312E3D;
    border-left: 1px solid #312E3D;
    border-right: 1px solid #312E3D;
    border-bottom: 1px solid #56536A;
    border-radius: 4px;
    background-color: #2D2D3F;
}
input::-webkit-input-placeholder{
    color: #fff;
}
.but{
    width: 300px;
    min-height: 20px;
    display: block;
    background-color: green ;
    border: 1px solid #01cd74;
    color: #fff;
    padding: 9px 14px;
    font-size: 17px;
    line-height: normal;
    border-radius: 5px;
    margin: 0;
}
.title{
    color: green;
    text-align: center;
    text-shadow:1px 1px 1px white;
}
.jump{
    text-align: right;
    margin-top: 10px;
}
.jump a{
    text-decoration: none;
    color: green;
    font-weight: bold;
    text-shadow:1px 1px 1px white;
}
</style>
</head>
<body>
 <div id="login">
        <span class="title"><h1>管理员登陆</h1></span>
        <form method="post" action="login">
            <input type="text" required="required"  name="userId" value="" placeholder="管理员账户"></input>
            <input type="password" required="required"  name="password" value="" placeholder="请输入密码"></input>
            <button class="but" type="submit">登录</button>
            <!-- onclick="window.location.href='back_manage/index.html'" -->
        </form>
        <div class="jump"><a href="../login">用户登录</a></div>
    </div>
</body>
</html>