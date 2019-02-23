<%--
  Created by IntelliJ IDEA.
  User: 13273
  Date: 2019/2/23
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<html>
<head>
    <title>用户管理</title>
    <%@ include file="/template/ResourcesController.jsp" %>
    <style>
        html, body {
            height: 100%;
            width: 100%;
            overflow-y: auto;
        }

        .layui-form-label {
            width: 35%;
        }

        .layui-input-block {
            margin-left: 35%;
            max-width: 350px;
        }
    </style>
</head>
<body>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header" style="text-align: center;font-size: 25px">用户信息管理界面</div>
        <div class="layui-card-body" style="height: 100%;">
            <form id="form" class="layui-form" lay-filter="form">
                <input type="hidden" name="uid">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码:</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码:</label>
                    <div class="layui-input-block">
                        <input type="password" name="repassword" required lay-verify="repassword|required"
                               placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required" placeholder="请输入真实姓名"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号码:</label>
                    <div class="layui-input-block">
                        <input type="text" name="telephone" required lay-verify="phone|required" placeholder="请输入手机号码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱:</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" required lay-verify="email|required" placeholder="请输入邮箱"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">生日:</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="birthday" name="birthday" required placeholder="请输入生日"
                               lay-verify="required">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别:</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked>
                        <input type="radio" name="sex" value="女" title="女">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注:</label>
                    <div class="layui-input-block">
                        <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class=" layui-form-item">
                    <div class="layui-inline" style=" margin-left: 24%;">
                        <button class="layui-btn" lay-submit lay-filter="submit">提交修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        <a href="#" onclick="javascript:history.back(-1)"><button class="layui-btn layui-btn-warm">返回</button></a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var uid = '${uid}';
    console.log(uid);
    layui.use(['form', 'layer', 'laydate'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        $(function () {
            $.when($.ajax({
                type: 'POST',
                url: 'user/SelectByUid.in',
                data: {
                    uid: uid
                },
                dataType: 'json',
                success: function (res) {
                    layer.msg('获取数据成功！');
                    form.val('form', {
                        uid: res.data.uid,
                        username: res.data.username,
                        password: res.data.password,
                        name: res.data.name,
                        birthday: res.data.birthday,
                        email: res.data.email,
                        sex: res.data.sex,
                        telephone: res.data.telephone,
                        remark: res.data.remark
                    });
                },
                error: function () {
                    layer.msg('获取数据失败！');
                }
            })).done(function () {

            })
        });

        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repassword: function (value) {
                var repassvalue = $('input[name=password]').val();
                if (value != repassvalue) {
                    return '两次输入的密码不一致！';
                }
            }
            , phone: [/^1[3|4|5|7|8]\d{9}$/, '手机必须11位，只能是数字！']
            , email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        });
        //监听提交
        form.on('submit(submit)', function (obj) {

            console.log(obj.field);
            $.when($.ajax({
                type:'POST',
                url:'user/UpDataByUid.in',
                data:obj.field,
                success:function () {
                    layer.msg("修改成功,正在跳转");
                    window.location.href ='javascript:history.back(-1)';
                },
                error:function () {
                    layer.msg("修改失败");
                }
            })).done(function () {

            });
            return false;
        });
        laydate.render({
            elem: '#birthday'
        });
    });
</script>
</body>
</html>
