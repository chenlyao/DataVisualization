<%--
  Created by IntelliJ IDEA.
  User: 13273
  Date: 2019/2/22
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>后台管理界面</title>
    <%@ include file="/template/ResourcesController.jsp" %>
</head>
<body class="layui-layout-body">
<div id="main" class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理界面</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <%--<ul class="layui-nav layui-layout-left">--%>
            <%--<li class="layui-nav-item"><a href="">控制台</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">商品管理</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">用户</a></li>--%>
            <%--<li class="layui-nav-item">--%>
                <%--<a href="javascript:;">其它系统</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="">邮件管理</a></dd>--%>
                    <%--<dd><a href="">消息管理</a></dd>--%>
                    <%--<dd><a href="">授权管理</a></dd>--%>
                <%--</dl>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="resources/images/logo/Administrator.png" class="layui-nav-img">
                    {{username}}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:history.back(-1)">返回</a></li>
            <li class="layui-nav-item"><a href="Exit.in">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item" v-for="(ms,i) in menus">
                <a href="javascript:void(0)">{{ms.name}}</a>
                <dl class="layui-nav-child">
                    <dd v-for="(m,j) in ms.menu"  @click="clickMenu(m,i,j)"><a href="javascript:void(0)">{{m.name}}</a></dd>
                </dl>
            </li>
            </ul>
        </div>
    </div>

    <div id="layui-body" class="layui-body" style="bottom: 0;">
        <!-- 内容主体区域 -->
        <div id="layui-tab" class="layui-tab layui-tab-card" lay-filter="mainTab" lay-allowClose="true" style="margin: 0;">
            <ul class="layui-tab-title" style="margin-bottom: 5px">

            </ul>
            <div id="layui-tab-content" class="layui-tab-content" style="padding: 0px">

            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 维修驿站团队
    </div>
</div>
<script>
    var username='${username}';
    function size() {
        $('#layui-tab').css('height',$('#layui-body').height()+'px');
        $('#layui-tab-content').css('height',$('#layui-tab').height()-45+'px');
    }
    $(function () {
        size();
    });
    window.onresize=function () {
        size();
    };
    var controller = new Vue({
        el: '#main',
        data: {
            username:username,
            menus:[
                {
                    name:'乡镇数据管理',
                    menu:[
                        {
                            name:'村级数据管理',
                            url:'VillageDataManagement.net'
                        },
                        {
                            name:'乡镇数据管理',
                            url:'TownDataManagement.net'
                        }
                    ]
                },
                {
                    name:'遥感数据管理',
                    menu:[
                        {
                            name:'遥感数据管理',
                            url:'RemoteDataManagement.net'
                        }
                    ]
                }
            ]
        },
        methods: {
            clickMenu:function (obj,i,j) {
                var id='p'+i+j;
                //判断指定页面是否已经存在
                if($('li[lay-id='+id+']').length==0){
                    element.tabAdd('mainTab', {
                        title: obj.name,
                        content: '<iframe src="' + obj.url + '" frameborder="0" width="100%" height="100%"></iframe>',
                        id: id
                    });
                    element.tabChange('mainTab',id);
                }
            }
        },
        created: function () {

        }
    });

    //JavaScript代码区域
    var element;
    layui.use('element', function () {
        element = layui.element;

    });
</script>
</body>
</html>
