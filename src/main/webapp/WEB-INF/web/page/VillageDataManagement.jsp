<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/2/7
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>数据管理</title>
    <%@ include file="/template/ResourcesController.jsp" %>
</head>
<body>
<div id="table" class="panel panel-default">
    <div class="panel-body">
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
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
                            <label class="layui-form-label">ID</label>
                            <div class="layui-input-block">
                                <input name="cjqydm" type="text" required lay-verify="required" placeholder="请输入ID"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">村名</label>
                            <div class="layui-input-block">
                                <input name="name" type="text" required lay-verify="required"
                                       placeholder="请输入村称" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">PH值</label>
                            <div class="layui-input-block">
                                <input name="ph" type="text" required lay-verify="required"
                                       placeholder="请输入PH值" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">有机质</label>
                            <div class="layui-input-block">
                                <input name="organic" type="text" required lay-verify="required"
                                       placeholder="请输入有机质" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">氮值</label>
                            <div class="layui-input-block">
                                <input name="ph" type="text" required lay-verify="required"
                                       placeholder="请输入氮值" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">磷值</label>
                            <div class="layui-input-block">
                                <input name="p" type="text" required lay-verify="required"
                                       placeholder="请输入磷值" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">钾值</label>
                            <div class="layui-input-block">
                                <input name="k" type="text" required lay-verify="required"
                                       placeholder="请输入钾值" autocomplete="off" class="layui-input">
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
        <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
    </script>
</div>
<script>

    layui.use(['table', 'layer', 'form'], function () {

        var form = layui.form;
        var layer = layui.layer;
        var table = layui.table;

        var village_length;
        var page = new Vue({
            el: '#table',
            data: {
                title: '',
                input: {},
                submit: ''
            },
            methods: {
                get_village_length: function () {
                    $.ajax({
                        type: 'POST',
                        url: 'village/get_village_length.in',
                        success: function (res) {
                            village_length = res;
                        }
                    })
                }
            },
            created: function () {
                this.get_village_length();
            }
        });

        table.render({
            elem: '#test'
            , url: 'map/GetVillageList.in'
            , toolbar: '#toolbarDemo'
            , title: '村级数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'cjqydm', title: 'ID', width: 180, fixed: 'left', totalRowText: '合计行'}
                , {field: 'name', title: '村名', width: 200}
                , {field: 'ph', title: 'PH值', width: 180}
                , {field: 'organic', title: '有机质', width: 180}
                , {field: 'n', title: '氮含量', width: 180}
                , {field: 'p', title: '磷含量', width: 180}
                , {field: 'k', title: '钾含量', width: 180}
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
                    "count": village_length, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            if (obj.event === 'add') {
                page.title = '新增数据';
                page.submit = '新增';
                form.val('form', {
                    cjqydm: '',
                    name: '',
                    ph: '',
                    organic: '',
                    n: '',
                    p: '',
                    k: ''
                });
                $('#myModal').modal();
            }
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
            }

        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event == 'check') {
                layer.open({
                    title: '查看数据'
                    , content: '暂无数据！'
                });
            }
            if (obj.event === 'del') {
                layer.confirm('真的删除行么？', function (index) {
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                page.title = '信息维护';
                page.submit = '提交更改';
                form.val('form', obj.data);
                $('#myModal').modal();
            }
        });

//按钮事件设置
        form.on('submit(formDemo)', function (obj) {
            if (page.submit == '提交更改') {
                //等待界面
                var index = layer.load();
                $.when($.ajax({
                        type: "POST",
                        dataType: 'json',
                        url: 'map/UpdateVillage.in',
                        data: obj.field,
                        success: function (res) {
                            layer.close(index);
                            $('#myModal').modal('hide');
                            layer.msg('更改成功');
                        },
                        error: function () {
                            layer.close(index);
                            $('#myModal').modal('hide');
                            layer.msg('更新出错');
                        }
                    })
                ).done(function () {
                    table.reload('table', {});
                });
            }
            return false;//若不关闭from会自动刷新页面
        });
    });
</script>

</body>
</html>
