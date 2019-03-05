<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/3/5
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/template/ResourcesController.jsp" %>
    <title>遥感影像管理</title>
    <style>
        .layui-form-label {
            width: 100px;
        }

        .form-img {
            width: 100px;
            cursor: pointer;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<table id="demo" lay-filter="test"></table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">{{title}}</h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" lay-filter="form">
                    <input type="hidden" name="uid">
                    <div class="layui-form-item">
                        <label class="layui-form-label">地图时间:</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="date" name="date" required lay-verify="required">

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">数据类型:</label>
                        <div class="layui-input-block">
                            <select name="datatype" required lay-verify="required" v-model="selected" autocomplete="off"
                                    class="layui-input">
                                <option v-for="option in select" v-bind:value="option">{{option}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最大值:</label>
                        <div class="layui-input-block">
                            <input type="text" name="max" required lay-verify="required"
                                   placeholder="请输入最大值" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最小值:</label>
                        <div class="layui-input-block">
                            <input type="text" name="min" required lay-verify="required"
                                   placeholder="请输入最小值" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item" v-bind:class="{hidden:show}">
                        <div class="layui-inline">
                            <label class="layui-form-label">图片文件:</label>
                            <div class="layui-input-block">
                                <img id="remote_picture" class="form-img" src=""
                                     alt="暂无图片">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn layui-btn-normal" id="updata_button">
                                    <i class="layui-icon">&#xe67c;</i>上传图片
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">{{submit}}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增数据</button>
    </div>
</script>
<script>

    var list_length;//数据长度


    var modal = new Vue({
        el: '#myModal',
        data: {
            title: '',
            submit: '',
            selected: '',
            select: ['NDVI', 'GNDVI', '生物量', '叶面积 ', '吸氮量', '产量'],
            show: false
        },
        methods: {
            get_list_length: function () {
                $.ajax({
                    type: 'POST',
                    url: 'remote/get_list_length.in',
                    success: function (res) {
                        list_length = res;
                    }
                })
            }
        },
        created: function () {
            this.get_list_length();
        }
    });
    layui.use(['table', 'layer', 'form', 'laydate', 'upload'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var upload = layui.upload;
        table.render({
            elem: '#demo',
            height: 'full-200',
            toolbar: '#toolbarDemo',
            url: 'remote/list.in',//数据接口
            page: true,//开启分页
            cols: [[
                {field: 'uid', title: 'UID', width: 350, fixed: 'left'},
                {field: 'date', title: '影像时间', width: 200},
                {field: 'datatype', title: '数据类型', width: 150},
                {field: 'max', title: '最大值', width: 150, sort: true},
                {field: 'min', title: '最小值', width: 150},
                {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]],
            response: {
                statusCode: "success" //重新规定成功的状态码为 200，table 组件默认为 0
            },
            parseData: function (res) {//将原始数据解析成table组件所规定的数据
                return {
                    "code": res.type,//解析接口状态
                    "msg": '',//解析提示文本
                    "count": list_length,//解析数据长度
                    "data": res.data//解析数据列表
                }
            }
        });

        //选定文件后不自动 上传
        upload.render({
            elem: '#updata_button',
            url: '',
            auto: false,
            acceptMime: 'image/*',
            choose: function (obj) {
                //上传文件
                var load = layer.load(3, {shade: [0.3, '#393D49']});
                //预读本地文件，如果是多文件，则会遍历。(不支持ie8、9)
                obj.preview(function (index, file, result) {
                    $.when($.ajax({
                        type: 'POST',
                        url: 'remote/insert_picture.in',
                        dataType: 'json',
                        data: {
                            imagebase64: result
                        },
                        success: function (res) {
                            $('#remote_picture').attr('src', result);
                            $('input[name=uid]').val(res);
                        },
                        error: function () {
                            layer.msg("上传出错");
                        }
                    })).done(function () {
                        layer.close(load);
                    })
                })
            }
        });
        laydate.render({
            elem: '#date'
        });
        table.on('tool(test)', function (obj) {
            modal.show = true;
            if (obj.event == 'edit') {
                form.val('form', obj.data);
                modal.title = '修改信息';
                modal.submit = '确认修改';
                $('#myModal').modal();
            }
            if (obj.event == 'del') {
                layer.open({
                    type: 0,
                    title: '删除',
                    content: '您确定删除吗？',
                    icon: 0,
                    btn: ['确定', '取消'],
                    yes: function () {
                        //等待界面
                        var index = layer.load();
                        $.when($.ajax({
                            type: "POST",
                            url: 'remote/delete.in',
                            data: {
                                uid: obj.data.uid
                            },
                            success: function (res) {
                                layer.close(index);
                                layer.msg("删除成功");
                            },
                            error: function () {
                                layer.close(index);
                                layer.msg("删除失败");
                            }
                        })).done(function () {
                            table.reload('demo', {})
                        })
                    }
                })
            }
        });
        table.on('toolbar(test)', function (obj) {
            modal.show = false;
            if (obj.event == 'add') {
                form.val('form', {
                    date: '',
                    datatype: '',
                    max: '',
                    min: '',
                    imagebase64: ''
                });
                modal.title = '新增数据';
                modal.submit = '确认新增';
                $('#myModal').modal();
            }
        });
        form.on('submit(formDemo)', function (data) {
            if (modal.submit == '确认新增') {
                //等待界面
                var index = layer.load();
                $.when($.ajax({
                    type: 'POST',
                    url: 'remote/update.in',
                    data: data.field,
                    success: function (res) {
                        layer.close(index);
                        $('#myModal').modal('hide');
                        layer.msg('新增成功');
                    },
                    error: function () {
                        layer.close(index);
                        $('#myModal').modal('hide');
                        layer.msg('新增出错');
                    }
                })).done(function () {
                    table.reload('demo', {});
                })
            }
            if (modal.submit == '确认修改') {
                $.when($.ajax({
                    type: 'POST',
                    url: 'remote/update.in',
                    data: data.field,
                    success: function (res) {
                        layer.close(index);
                        $('#myModal').modal('hide');
                        layer.msg('修改成功');
                    },
                    error: function () {
                        layer.close(index);
                        $("#myModal").modal('hide');
                        layer.msg('新增出错');
                    }
                })).done(function () {
                    table.reload('demo', {});
                })
            }
            return false;
        });

    })

</script>
</body>
</html>
