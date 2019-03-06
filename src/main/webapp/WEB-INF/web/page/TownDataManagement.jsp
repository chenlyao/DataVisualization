<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/3/6
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/template/ResourcesController.jsp" %>
    <title>乡镇数据管理</title>
</head>
<body>
<div id="table" class="panel panel-default">
    <div class="panel-body">
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-normal " lay-event="add">新增</button>
            <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
            <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
            <%--<button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
        </div>
    </script>

    <script type="text/html" id="barDemo">
        <%--<a class="layui-btn layui-btn-xs layui-btn-normal " lay-event="check">查看</a>--%>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>
<script>
    layui.use(['table','layer','form'],function () {
        var form=layui.form;
        var layer=layui.layer;
        var table=layui.table;

        var list_length;
        var control=new Vue({
            el:'#table',
            data:{},
            methods:{
                get_list_length:function () {
                    $.ajax({
                        type:"POST",
                        url:'town/get_list_length.in',
                        success:function (res) {
                            list_length=res;
                        }
                    })
                }
            },
            created:function () {
                this.get_list_length();
            }
        });


        table.render({
            elem: '#test'
            , url: 'town/select.in'
            , toolbar: '#toolbarDemo'
            , title: '村级数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'uid', title: 'UID', width: 180, fixed: 'left', totalRowText: '合计行'}
                , {field: 'name', title: '乡镇名', width: 200}
                , {field: 'type', title: '类型', width: 180}
                , {fixed: 'right', title: '操作', fixed: 'right', toolbar: '#barDemo', width: 120}
            ]]
            , page: {
                layout: ['count', 'prev', 'page', 'next', 'skip', 'limit'] //自定义分页布局
                , curr: 1 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                // , first: true //不显示首页
                // , last: true //不显示尾页
                , limit: 20
            }
            , height: 'full-200'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , request: { //发送请求
                pageName: 'page', //页码的参数名称，默认：page
                limitName: 'limit' //每页数据量的参数名，默认：limit
            }
            , response: {
                statusCode: "success" //重新规定成功的状态码为 200，table 组件默认为 0
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                console.log(res);
                return {
                    "code": res.type, //解析接口状态
                    "msg": '', //解析提示文本
                    "count": list_length, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
        });
    })
</script>
</body>
</html>
