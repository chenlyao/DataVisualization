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
                    <input type="hidden" name="PK">
                    <div class="layui-form-item">
                        <label class="layui-form-label">地图时间:</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="date" name="DATE" required lay-verify="required">

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">数据类型:</label>
                        <div class="layui-input-block">
                            <select name="DATATYPE" required lay-verify="required" v-model="selected" autocomplete="off"
                                    class="layui-input">
                                <option v-for="option in select" v-bind:value="option">{{option}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最小值:</label>
                        <div class="layui-input-block">
                            <input type="text" name="MINDATA" required lay-verify="required"
                                   placeholder="请输入最小值" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">最大值:</label>
                        <div class="layui-input-block">
                            <input type="text" name="MAXDATA" required lay-verify="required"
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
    var modal=new Vue({
        el:'#myModal',
        data:{
         title:'',
         submit:'',
         selected:'',
         select:['NDVI','GNDVI','生物量','叶面积 ','吸氮量','产量'],
         show:false
        }
    })
    layui.use(['table','layer','form','laydate','upload'],function () {
        var table=layui.table;
        var layer=layui.layer;
        var form=layui.form;
        var laydate=layui.laydate;
        var upload=layui.upload;
    })

</script>
</body>
</html>
