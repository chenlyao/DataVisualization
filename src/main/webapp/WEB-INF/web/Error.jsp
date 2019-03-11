<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/3/11
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误信息</title>
    <%@include file="/template/ResourcesController.jsp" %>
    <style>
        #index h1{
            position: fixed;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            margin: auto;
            height: 8em;
            width: 15em;
        }
    </style>
</head>
<body>
<div id="index">
    <h1>{{title}}</h1>
</div>
<script>
    var control = new Vue({
        el: "#index",
        data: {
            title: "页面被黑洞吸走了！！！"
        },
        methods:{

        },
        created:function () {

        }
    })
</script>
</body>
</html>
