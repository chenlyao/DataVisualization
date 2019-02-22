<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2018/12/31
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!DOCTYPE html>
<html>
<head>
    <title>登陆界面</title>
    <%@ include file="/template/ResourcesController.jsp" %>
    <link rel="stylesheet" href="lib/slide-unlock/slide-unlock.css">
    <style>
        html, body {
            height: 100%;
            width: 100%;
            overflow: hidden;
        }

        .bg {
            background: url('resources/images/one.jpg') center;
            background-size: 100% 100%;
        }

        .from {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .input {
            position: relative;
            height: auto;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
            margin-top: 3px;
        }

        #slider {
            margin-top: 10px;
            padding: 0 0;
            display: none;
            height: 40px;
            position: relative;
            border-radius: 20px;
            background-color: #dae2d0;
            overflow: hidden;
            text-align: center;
            user-select: none;
            -moz-user-select: none;
            -webkit-user-select: none;
        }

        #slider_bg {
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            background-color: #7AC23C;
            z-index: 1;
        }

        #label {
            width: 46px;
            position: absolute;
            left: 0;
            top: 0;
            height: 40px;
            line-height: 38px;
            border: 1px solid #cccccc;
            background: #fff;
            z-index: 3;
            cursor: move;
            color: #ff9e77;
            font-size: 16px;
            font-weight: 900;
        }

        #labelTip {
            position: absolute;
            left: 0;
            width: 100%;
            height: 100%;
            font-size: 13px;
            font-family: 'Microsoft Yahei', serif;
            color: #787878;
            line-height: 38px;
            text-align: center;
            z-index: 2;
        }

        #label {
            font-family: "宋体";
        }
    </style>
</head>
<body class=" bg">

<div id="login" class="container " style="height: 100%">
    <div style="margin-top:12em">
        <div class="from">
            <h2 class="text-center" style="color: whitesmoke">用户登陆</h2>
            <label for="username" class="sr-only">账号</label>
            <input type="text" id="username" class="form-control input" placeholder="请输入账号" required autofocus
                   v-model="user.username">
            <label for="password" class="sr-only">密码</label>
            <input type="password" id="password" class="form-control input" placeholder="请输入密码" required
                   v-model="user.password">
            <div class="checkbox">
                <label style="color: white">
                    <input type="checkbox" value="remember-me" v-model="checked"> 记住我
                </label>
                <button class="btn btn-info" style="float: right" v-on:click="Register">注册</button>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" style="margin-top: 18px" id="loading"
                    v-on:click="slide">登陆
            </button>
            <div id="slider" class="form-control">
                <div id="slider_bg"></div>
                <span id="label" style="margin-top: -1px;margin-left: -1px">>></span> <span id="labelTip">拖动滑块验证</span>
            </div>
        </div>
    </div>
</div>
</body>

<script src="lib/slide-unlock/jquery.slideunlock.js"></script>
<script>
    layui.use(['layer'], function () {
        var layer = layui.layer;

        var login = new Vue({
            el: '#login',
            data: {
                user: {
                    username: '',
                    password: '',
                    isSave: false
                },
                checked: ''
            },
            mounted: function () {
                this.getCookie();
            },
            methods: {
                isLogin: function () {
                    $('#slider').css('display', 'none');
                    //判断复选框是否被勾选 勾选则调用配置cookie方法
                    if (this.checked == true) {
                        //传入账号名，密码，和保存天数3个参数
                        this.setCookie(this.user.username, this.user.password, 7);
                    } else {
                        console.log("清空Cookie");
                        //清空Cookie
                        this.clearCookie();
                    }

                    //登陆验证
                    $.ajax({
                        type: 'POST',
                        url: 'isLogin.in',
                        dataType: 'json',
                        data: {
                            username: this.user.username,
                            password: this.user.password
                        },
                        success: function (data) {
                            if (data.type == "error") {
                                layer.msg("账号或密码不正确！");
                            }
                            if (data.type == "success") {
                                //进入两区地图界面
                                window.location.href = "main.net";
                            }
                        }
                    });
                },
                //跳转注册
                Register: function () {
                    window.location.href = "Register.net";
                },
                //滑动验证
                slide: function () {
                    $('#slider').css('display', 'block');
                },
                //设置cookie
                setCookie: function (c_name, c_pwd, exdays) {
                    var exdate = new Date();//获取时间
                    exdate.setTime(exdate.getTime() + 24 * 60 * 60 * 1000 * exdays);//保存的天数
                    //字符串拼接cookie
                    window.document.cookie = "username" + "=" + c_name + ";path=/;expires=" + exdate.toGMTString();
                    window.document.cookie = "password" + "=" + c_pwd + ";path=/;expires=" + exdate.toGMTString();
                },
                //读取cookie
                getCookie: function () {
                    if (document.cookie.length > 0) {
                        // console.log(document.cookie);
                        var arr = document.cookie.split('; ');//这里显示的格式需要切割一下自己可输出看下
                        for (var i = 0; i < arr.length; i++) {
                            var arr2 = arr[i].split('=');//再次切割
                            //判断查找相对应的值
                            if (arr2[0] == 'username') {
                                this.user.username = arr2[1];//保存到保存数据的地方
                            } else if (arr2[0] == 'password') {
                                this.user.password = arr2[1];
                            }
                        }
                    }
                },
                //清除cookie
                clearCookie: function () {
                    this.setCookie("", "", -1);//修改2值都为空，天数为负1天就好了
                }
            }
        });

        $(function () {
            //判断是否按下回车键
            $(document).keyup(function (event) {
                if (event.keyCode == '13')
                    login.slide();
            });

            var slider = new SliderUnlock("#slider", {
                successLabelTip: "验证成功"
            }, function () {
                layer.msg("验证成功,正在跳转！");
                login.isLogin();
                //以下四行设置恢复初始，不需要可以删除
                setTimeout(function () {
                    $("#labelTip").html("拖动滑块验证");
                    $("#labelTip").css("color", "#787878");
                }, 2000);
                slider.init();
            });
            slider.init();
        });

    });
</script>
</html>
