<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/22
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <meta charset="UTF-8">
    <title>系统主界面</title>
    <%@ include file="/template/ResourcesController.jsp" %>
    <style>
        body {
            display: flex;
            justify-content: flex-start;
            flex-direction: column;
            overflow-y: hidden;
        }
    </style>
</head>
<body>
<div id="main">
    <nav class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom:0">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">农业数据可视化管理系统</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">天气预览 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li data-toggle="modal" data-target="#weather"><a>天气预报</a></li>
                            <li data-toggle="modal" data-target="#weather_seven"><a>七天天气</a></li>
                        </ul>
                    </li>
                    <li :class="{'active':首页.active}" @click="clickButton(首页)"><a href="#">首页</a></li>
                    <li :class="{'active':土壤养分.active}" @click="clickButton(土壤养分)"><a href="#">土壤养分</a></li>
                    <li :class="{'active':测土配方.active}" @click="clickButton(测土配方)"><a href="#">测土配方</a></li>
                    <li :class="{'active':遥感监测.active}" @click="clickButton(遥感监测)"><a href="#">遥感监测</a></li>
                </ul>
                <%--<form class="navbar-form navbar-left">--%>
                <%--<div class="form-group">--%>
                <%--<input type="text" class="form-control" placeholder="Search">--%>
                <%--</div>--%>
                <%--<button type="submit" class="btn btn-default">查询</button>--%>
                <%--</form>--%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">{{username}}</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">设置<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a id="bg" href="">后台管理</a></li>
                            <li><a id="user" href="" onclick="GotoUserManagement()">用户设置</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Exit.in">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="container-fluid"
         style=" flex-grow: 1;position: fixed; top: 5%;height: 91%;width: 100%;padding: 0;margin: 0">
        <iframe id="iframe" src="BasicMap.net" name="content" frameborder="0" width="100%" height="100%"></iframe>
    </div>
    <%--天气预报--%>
    <div class="modal fade" id="weather" tabindex="-1" role="dialog" aria-labelledby="ModalTwoLabel"
         aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        天气预报
                    </h4>
                </div>
                <div class="modal-body">
                    <div style="flex-grow: 1;height:80px;width: 40%;">
                        <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=4" width="550"
                                height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"
                                style="border:solid 1px #7ec8ea"></iframe>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <%--七天天气预报--%>
    <div class="modal fade  bs-example-modal-lg" id="weather_seven" tabindex="-1" role="dialog"
         aria-labelledby="ModalTwoLabel"
         aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        天气预报
                    </h4>
                </div>
                <div class="modal-body">
                    <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=57" width="650"
                            height="427" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <%--底部--%>
    <nav class="navbar navbar-inverse navbar-fixed-bottom" style="min-height: 40px">
        <div class="container">
        </div>
    </nav>
</div>

<script>
    <%--var data = '<%=session.getAttribute("data")%>';--%>//获取session中的对象
    $(function () {

    });

    function GotoUserManagement() {
        $('#user').attr("href", "UserManagement.net?uid=" + data.data.uid);
    }

    data = eval('(' + data + ')');
    var control = new Vue({
        el: '#main',
        data: {
            username: data.data.username,
            首页: {
                active: true,
                url: "BasicMap.net"
            },
            土壤养分: {
                active: false,
                url: 'SoilMoistureMap.net'
            },
            测土配方: {
                active: false,
                url: 'SoilTestMap.net'
            },
            遥感监测: {
                active: false,
                url: 'RemoteSensingMap.net'
            }
        },
        methods: {
            clickButton: function (button) {
                //    切换激活按钮
                this.首页.active = false;
                this.土壤养分.active = false;
                this.测土配方.active = false;
                this.遥感监测.active = false;
                button.active = true;
                window.content.location.href = button.url;
            }
        },
        created: function () {

        }
    });

</script>
</body>
</html>
