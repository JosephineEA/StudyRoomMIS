<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>自习室充值</title>
    <script src="https://cdn.suoluomei.com/common/js/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.suoluomei.com/common/js2.0/vue/v2.5.16/vue.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
</head>
<style>
    * {
        margin: 0;
        padding: 0;
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

    body {
        background-image: url(.../image/bodybg.jpg);
    }

    .back {
        background-color: white;
        width: 60%;
        border-radius: 10px;
        margin:0 auto;
        margin-top: 2%;
        padding-bottom: 2%;
        padding-top: 2%;
    }

    .bechoice {
        background: green !important;
        color: white !important;
    }

    .information {
        display: flex;
        flex-direction: column;
        width: 100%;
    }

    .information span {
        width: 95%;
        font-size: 1.1rem;
        margin-left: 2%;
    }

    .information input {
        width: 95%;
        border-radius: 7px;
        height: 2rem;
        text-align: center;
        line-height: 2rem;
        outline: none;
        color: green;
        font-size: 1.1rem;
        border: 2px solid;
        margin-top: 2.5%;
        margin-left: 2%;
        margin-bottom: 2.5%;
    }

    .choice {
        width: 100%;
        margin-top: 1rem;
        margin-bottom: 1rem;
    }

    .choice p {
        font-size: 1.1rem;
        margin-left: 2%;
    }

    .recharge_hurg ul {
        flex-direction: row;
        width: 100%;
        flex-wrap: wrap;
        display: flex;
        justify-content: center;
    }

    .recharge_hurg ul li {
        list-style-type: none;
        width: 29.5%;
        margin-right: 2%;
        border-radius: 0.5rem;
        height: 2.5rem;
        text-align: center;
        line-height: 2.5rem;
        margin-bottom: 1rem;
        border: 2px green solid;
        color: green;
    }

    .recharge_hurg ul li:nth-child(3n) {
        margin-right: 0 !important;
    }

    .recharge_hurg_price {
        width: 100%;
        text-align: center;
        margin: 1.25rem 0;
    }

    .recharge_hurg_price span {
        color: green;
        font-weight: 600;
        font-size: 23px;
    }

    .recharge_btn {
        width: 96%;
        background: green;
        color: white;
        height: 2.5rem;
        border-radius: 0.5rem;
        text-align: center;
        line-height: 2.5rem;
        font-size: 1.25rem;
    }

    .recharge_hurg ul input {
        list-style-type: none;
        width: 100%;
        margin-right: 2%;
        border-radius: 7px;
        height: 35px;
        text-align: center;
        line-height: 40px;
        border-style: none;
        text-shadow: none;
        -webkit-appearance: none;
        box-shadow: none;
        outline: none;
        color: green;
        font-size: 1.1rem;
    }

    ::-webkit-input-placeholder {
        /* WebKit, Blink, Edge */
        color: #aaa;
    }

    :-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        color: #aaa;
        opacity: 1;
    }

    ::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        color: #aaa;
        opacity: 1;
    }

    :-ms-input-placeholder {
        /* Internet Explorer 10-11 */
        color: #aaa;
    }
</style>

<body>
    <div id="Vue">
        <div class="top">
            <p>自习室账户充值</p>
        </div>
        <div class="back">
            <!-- <div class="information">
                <span>用户名：</span>
                <input type="text" placeholder="请输入充值账户用户名" v-model="name" onkeyup="value=value.replace(/[\d]/g,'') "
                   
                    oninput="if(value.length>30)value=value.substring(0,30)">
                <span>电话：</span>
                <input type="number" placeholder="请输入您的号码" v-model="phone"
                    onkeyup="this.value=this.value.replace(/\D/g,'')"
                    oninput="if(value.length>11)value=value.substring(0,11)">
                <span>用户账户：</span>
                <input type="number" placeholder="请输入充值账户" v-model="card"
                    onkeyup="this.value=this.value.replace(/\D/g,'')">
            </div> -->
            <div class="choice">
                <p>请选择充值的金额</p>
            </div>
            <div class="recharge_hurg">
                <ul>
                    <li :class="[index == status ? 'bechoice':'']" v-for="(item,index) in list" :key="index"
                        @click="choicePrice(index,item.price)">{{item.price}}元</li>
                    <li>
                        <input id="otheramount" type="number" placeholder="其他金额" @click="choiceother" v-model="question"
                            onkeyup="this.value=this.value.replace(/\D/g,'')"
                            oninput="  if(value>999999)value=999999;if(value.length>7)value=value.substring(0,7)">
                    </li>
                    <p class="recharge_hurg_price">
                        充值金额：
                        <span>{{thePrice}}.00</span><span style="color: black;">元</span>
                    </p>
                    <div class="recharge_btn" @click="wxpaly">微信充值</div>
            </div>
        </div>
    </div>

    <div style="text-align: center;"><a href="../wallet"><button>返回</button></a><center>

</body>
<script>
    new Vue({
        el: "#Vue",
        data: {
            ko: "",
            question: "",
            status: 0,
            thePrice: 10,
            confirm: "",
            name: "",
            phone: "",
            card: "",
            list: [
                { price: 10 },
                { price: 20 },
                { price: 30 },
                { price: 50 },
                { price: 100 },
                { price: 300 },
                { price: 500 },
                { price: 1000 },
            ],

        },
        watch: {
            // 如果 `question` 发生改变，这个函数就会运行
            question: function (newQuestion, oldQuestion) {
                //如果第一位数为0时
                if (this.question[0] == "0") {
                    console.log(this.question[0])
                    this.question = ""
                    this.thePrice = 0
                }
                //如果question为空时
                if (this.question == "") {
                    this.thePrice = 0
                }
                else {
                    this.thePrice = this.question
                    this.question = this.question.replace(/\D/g, '')
                }
            },
            // 如果 `name` 发生改变，这个函数就会运行
            name: function (newName, oldName) {
                if (this.name[0] == "0") {
                    this.name = ""
                    console.log(1)
                }
            },
            // 如果 `phone` 发生改变，这个函数就会运行
            phone: function (newPhone, oldPhone) {
                //如果第一位数为0时
                if (this.phone[0] == "0") {
                    this.phone = ""
                }
                this.phone = this.phone.replace(/\D/g, '')
                console.log(1)
            },
            // 如果 `card` 发生改变，这个函数就会运行
            card: function (newCard, oldCard) {

            }
        },
        methods: {
            choicePrice(index, price) {
                this.status = index
                this.thePrice = price
            },
            choiceother() {
                this.status = null
                //当`question`为空时 
                if (this.question == "") {
                    this.thePrice = 0
                }
            },

            wxpaly() {
                // console.log(this.confirm = parseInt(this.thePrice))
                /*if (this.name == "" || this.phone == "" || this.card == "") {
                    alert("请填写空余信息")
                } else {*/
                    //console.log(this.name)
                    //console.log(this.phone)
                    //console.log(this.card)
                    console.log(this.confirm = parseInt(this.thePrice))
                    //alert("已成功充值：" + this.confirm)
                var params = {
                    money:this.confirm
                }
                httpPost("recharge", params);
                //}


            },
            input() {

            }
        },
        created() {

        }
    })
</script>
<script>
    $(document).ready(function () {

    });
</script>
<script>
    function httpPost(URL, PARAMS) {
        var temp = document.createElement("form");
        temp.action = URL;
        temp.method = "post";
        temp.style.display = "none";

        for (var x in PARAMS) {
            var opt = document.createElement("textarea");
            opt.name = x;
            opt.value = PARAMS[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();

        return temp;
    }
</script>
</html>
