<!-- 语言: Html、Css、Javascript -->
<!-- 工具: HbuilderX -->
<!-- 使用Ctrl+/ 可快速多行注释/取消注释 -->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>首页</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./index.css">
    <link type="text/css" rel="stylesheet" href="css/slideShow.css"/>    
    </head>
    <style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background: url(./image/bodybg.jpg) no-repeat;
        background-size: 2526.67px;
    }
    .header{
        height: 40px;
        background-color: #333;
    }
    .nav{
        width: 1226px;
        height: 100px;
        background-color: green;
        /* div居中 */
        margin: 0 auto;
    }
    .nav li a{
        float: left;
        display:block;
        width: 153.25px;
        text-decoration: none;
        text-align: center;
        color: #fff;
        line-height: 100px;
        font-size: 30px;
        font-weight: bold;
    }
    .nav li a:hover{
        background-color: orange;
        color: #ffffff;
    }
    .banner{
            width: 1226px;
            height: 460px;
            /* background-color: yellow; */
            margin: 0 auto;
            margin-bottom: 100px;
        }
    .left {
            width: 234px;
            height: 460px;
            background-color: rgb(7, 170, 121);
            float: left;
        }
    .imgBox{
        width: 992px;
        height: 460px;
        float: right;
    }
    .box{
            width: 1226px;
            height: 614px;
            /* background-color:yellow; */
            margin: 0 auto;
        }
    .left1{
        width: 234px;
        height: 614px;
        background-color: rgb(7, 170, 121);
        float: left;
    }
    .right1{
        width: 978px;
        height: 614px;
        float: right;
    }
    .item{
        float: left;
        width: 234px;
        height: 300px;
        background-color: #87ceeb;
        margin-right: 14px;
        margin-bottom: 14px;
    }
    #i1{
        background-image: url("./image/c1.png");
        box-sizing: border-box
    }
    #i2{
        background-image: url("./image/c2.png");
        box-sizing: border-box
    }
    #i3{
        background-image: url("./image/c3.png");
        box-sizing: border-box
    }
    #i4{
        background-image: url("./image/c4.png");
        box-sizing: border-box
    }
    #i5{
        background-image: url("./image/c5.png");
        box-sizing: border-box
    }
    #i6{
        background-image: url("./image/c6.png");
        box-sizing: border-box
    }
    #i7{
        background-image: url("./image/c7.png");
        box-sizing: border-box
    }
    #i8{
        background-image: url("./image/c8.png");
        box-sizing: border-box
    }
    .item:nth-child(4n){
        margin-right: 0;
    }
    .item:nth-child(n+5){
        margin-bottom: 0;
    }
    li{
        list-style: none;
    }
    .item a{

        display: inline-block;
        width: 234px;
        height: 65px;
        font-size: 40px;
        background-color:green;
        text-align: center;
        font-weight: bold;
        color: #fff;
    }
    .item a:hover{
        background-color: orange;
    }
</style>
    <body>
            <div class="header"></div>
            <div class="nav">
                <ul>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                    <li><a href="#" disabled="disabled">导航</a></li>
                </ul>
            </div>
        <div class="banner">
                <div class="left"></div>
                <div class="imgBox">
                    <!-- alt：图片路径失败时替换显示内容 -->
                    <img class="img-slide img" src="./image/cat1.png" alt="img1">
                    <img class="img-slide img" src="./image/cat2.png" alt="img2">
                    <img class="img-slide img" src="./image/cat3.png" alt="img3">
                    <img class="img-slide img" src="./image/cat4.png" alt="img4">
                    <img class="img-slide img" src="./image/cat5.png" alt="img5">
                </div>
        </div>
        <div class="box">
            <div class="left1"></div>
            <div class="right1">
                <div class="item" id="i1">&emsp;&emsp;<a href="main/sign">签到/签离</a></div>
                <div class="item" id="i2">&emsp;&emsp;<a href="main/seat">座位预约</a></div>
                <div class="item" id="i3">&emsp;&emsp;<a href="main/forum">猫咪论坛</a></div>
                <div class="item" id="i4">&emsp;&emsp;<a href="main/wallet">我的钱包</a></div>
                <div class="item" id="i5">&emsp;&emsp;<a href="#" disabled="disabled">待开发...</a></div>
                <div class="item" id="i6">&emsp;&emsp;<a href="#" disabled="disabled">待开发...</a></div>
                <div class="item" id="i7">&emsp;&emsp;<a href="#" disabled="disabled">待开发...</a></div>
                <div class="item" id="i8">&emsp;&emsp;<a href="#" disabled="disabled">待开发...</a></div>
            </div>
        </div>
    </body>
    
    <script type="text/javascript">
        // index：索引， len：长度
        var index = 0, len;
        // 类似获取一个元素数组
        var imgBox = document.getElementsByClassName("img-slide");
        len = imgBox.length;
        imgBox[index].style.display = 'block';
        // 逻辑控制函数
        function slideShow() {
            index ++;
            // 防止数组溢出
            if(index >= len) index = 0;
            // 遍历每一个元素
            for(var i=0; i<len; i++) {
                imgBox[i].style.display = 'none';
            }
            // 每次只有一张图片显示
            imgBox[index].style.display = 'block';
        }
        
        // 定时器，间隔3s切换图片
        setInterval(slideShow, 3000);
        
    </script>
    
</html>