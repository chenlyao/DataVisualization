<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/1/27
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<html>
<head>
    <title>注册界面</title>
    <%@ include file="/template/ResourcesController.jsp" %>
    <link href="lib/bootstrap-3.3.7-dist/bootstrapValidator/css/bootstrapValidator.css" rel="stylesheet">
    <style>
        input {
            max-width: 300px;
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header ">
            <a class="navbar-brand" href="#" style="padding: 10px 10px">
                <img alt="Brand" src="resources/images/logo/bigdata.png" style="height: 30px;width: 30px">
            </a>
            <p class="navbar-text" style="color: white;font-size: 14px;">注册界面</p>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <form class="form-horizontal" role="form" id="form">
        <div class="form-group">
            <label for="username" class="col-sm-5 control-label">用户名:</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="username" name="username" v-model="username">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-5 control-label">密码:</label>
            <div class="col-sm-7">
                <input type="password" class="form-control" id="password" name="password" v-model="password">
            </div>
        </div>

        <div class="form-group">
            <label for="confirmPassword" class="col-sm-5 control-label">确认密码:</label>
            <div class="col-sm-7">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-5 control-label">Email:</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="email" name="email" v-model="email">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-5 control-label">真实姓名:</label>
            <div class="col-sm-7">
                <input type="text" class="form-control" id="name" name="name" v-model="name">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">性别:</label>
            <div class="col-sm-7">
                <label class="radio-inline">
                    <input type="radio" name="sex" id="male" value="男" v-model="sex" checked> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" id="female" value="女" v-model="sex"> 女
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label"></label>
            <div class="col-sm-7">
                <button type="submit" name="submit" class="btn btn-primary" id="submit" @click="register">提交注册</button>
            </div>
        </div>
    </form>
</div>
<script src="lib/bootstrap-3.3.7-dist/bootstrapValidator/js/bootstrapValidator.js"></script>
<script>
    layui.use(['form', 'layer', 'laydate'], function () {
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;

    var register = new Vue({
        el: '#form',
        data: {
            username: null,
            password: null,
            email: null,
            name: null,
            sex: null
        },
        methods: {
            register: function () {
                if (register.username != null && register.password != null && register.email != null && register.name != null && register.sex != null) {
                    $.ajax({
                        type: 'post',
                        url: 'Register.in',
                        dataType: 'json',
                        data: {
                            username: register.username,
                            password: register.password,
                            email: register.email,
                            name: register.name,
                            sex: register.sex
                        },
                        success: function (data) {
                            if (data.type == "success") {
                               layer.msg("注册成功！");
                                window.location.href = "${pageContext.request.contextPath}/";
                            } else {
                                layer.msg("注册失败！");
                            }
                        }
                    })
                }
            }
        }
    });
    $(function () {
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                password: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        },
                        different: {
                            field: 'username',
                            message: '密码不能与用户名相同'
                        }
                    }
                },
                confirmPassword: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {  //比较是否相同
                            field: 'password',  //需要进行比较的input name值
                            message: '两次密码不一致'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱地址格式有误'
                        }
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        }
                    }
                }
            }
        });
    });
});
</script>
</body>
</html>
