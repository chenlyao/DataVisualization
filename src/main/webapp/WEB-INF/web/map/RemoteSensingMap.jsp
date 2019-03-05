<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/2/6
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>遥感监测</title>
    <%@include file="/template/ResourcesController.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/leaflets/leaflet/leaflet.css">

    <style>
        .leaflet-control-mouseposition {
            bottom: 10px;
        }

        body {
            display: flex;
            justify-content: flex-start;
            flex-direction: column;
            overflow-y: hidden;
        }

        #map {
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        /*GP服务图例样式*/
        .Lenged_css {
            z-index: 1000;
            position: fixed;
            bottom: 3em;
            right: 0;
            width: 180px;
            border: 1px solid #C0C0C0;
            border-radius: 5px;
            background-color: white;
            opacity: 1;
            margin-right: 20px;
            padding: 10px
        }

        #panel {
            height: 500px;
            width: 250px;
            position: fixed;
            background: rgba(0, 0, 0, 0.6);
            top: 15%;
            right: 0;
            z-index: 10
        }

        /*滚动条样式*/
        #panel::-webkit-scrollbar { /*滚动条整体样式*/
            width: 4px; /*高宽分别对应横竖滚动条的尺寸*/
            height: 4px;
        }

        #panel::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
            border-radius: 5px;
            -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            background: rgba(0, 0, 0, 0.2);
        }

        #panel::-webkit-scrollbar-track { /*滚动条里面轨道*/
            -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            border-radius: 0;
            background: rgba(0, 0, 0, 0.1);
        }

        #legend_div {
            display: none;
        }

        #legend {
            z-index: 400;
            width: 80px;
            height: 180px;
            background-color: white;
            position: fixed;
            bottom: 40%;
            right: 20%;

            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        #legend > img {
            flex-grow: 1;
        }
    </style>
</head>
<body>

<div style="flex-grow: 1;width: 100%;height: 100%">
    <div id="map"></div>
</div>
<%@include file="/template/ResourcesMap.jsp" %>
<%@include file="/template/CommonMap.jsp" %>
<div id="panel" style="flex-grow: 1;overflow-y: auto;">
    <div>
        <label class=" control-label" style="margin-top: 5px">数据类型:</label>
        <select id="select" class="form-control" v-on:change="select_change" v-model="selected">
            <option v-for="option in select" v-bind:value="option">{{option}}</option>
        </select>
    </div>
    <div style="text-align: center;margin-top: 5px">
        <button class="layui-btn " v-bind:class="play" v-on:click="play_image">数据播放</button>
    </div>
    <div id="li_list">
        <ul class="layui-timeline" style="margin-left:10%;margin-top: 10px">
            <li class="layui-timeline-item " v-for="li in list" @click="click(li)" style="cursor:pointer;">
                <i class="layui-icon layui-timeline-axis li_change"></i>
                <div class="layui-timeline-content layui-text" style="color: white">
                    <h3 class="layui-timeline-title" style="color: white">{{li.date}}</h3>
                    <p>{{li.datatype}}</p>
                    <ul>
                        <li disabled="">{{li.max}}</li>
                        <li>{{li.min}}</li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    <div id="legend_div" v-bind:class="{show:legend.show}">
        <div id="legend">
            <div style="background-color: #1d1d1d; width: 100%">
                <font style="line-height: 20px; color: white; text-align: center; width: 100%">{{legend.date}}</font>
            </div>
            <font>ndvi指数</font>
            <font>{{legend.maxData}}</font>
            <img v-bind:src="legend.img">
            <font>{{legend.minData}}</font>
        </div>
    </div>
</div>

<script>
    layui.use('layer', function () {
    });

    var page = new Vue({
        el: '#panel',
        data: {
            selected: '',
            select: ['NDVI', 'GNDVI', '生物量', '叶面积', '产量', '吸氮量'],
            list: [],
            play: 'layui-btn-disabled',
            //当前图例对象
            legend: {
                minData: 0,
                maxData: 0,
                img: 'resources/images/legend.jpg',
                show: false,
                date: ''
            }
        },
        methods: {
            select_change: function () {
                var _this = this;
                var datatype = this.selected;
                var load = layer.load();
                var index = layer.open({type: 3});
                $.when($.ajax({
                    type: 'POST',
                    dataType: 'json',
                    url: 'remote/select_all.in',
                    data: {
                        datatype: datatype
                    },
                    success: function (res) {
                        _this.list = res.data;
                        if (_this.list.length > 0) {
                            layer.msg("数据加载成功");
                            _this.play = '';

                        } else {
                            _this.list = [];
                            layer.msg("未查询到数据");
                            _this.play = 'layui-btn-disabled';
                            cleanIamges();
                            _this.legend.show = false;
                        }
                    }
                })).done(function () {
                    layer.close(load);
                    layer.close(index);
                })
            },
            click: function (data) {
                var image = data.imagebase64;
                showImages(image);
                this.legend.show = true;
                this.legend.minData = data.min;
                this.legend.maxData = data.max;
                this.legend.date = data.date;
                layer.msg(data.date);
            },
            play_image: function () {
                var data = this.list;
                var time = 0;
                var _this = this;
                _this.play = 'layui-btn-disabled';
                if (data.length > 0) {
                    var f = function (obj) {
                        setTimeout(function () {
                            _this.click(obj);
                        }, time);
                        time = time + 3000;
                    };
                    for (var i in data) {
                        f(data[i]);
                    }
                    setTimeout(function () {
                        _this.play = '';
                    }, time);
                }
            }
        },
        created: function () {

        }
    });


    var Images = [];//定义
    //清空照片
    function cleanIamges() {
        for (var i = 0; i < Images.length; i++) {
            Images[i].remove();
        }
        Images.length = 0;
    }

    //显示地图
    function showImages(url) {
        cleanIamges();
        var a = [37.857408, 116.907158];
        var b = [37.423278, 117.348518];
        var bounds = new L.LatLngBounds(a, b);
        Images.push(L.imageOverlay(url, bounds, {
            zIndex: 10
        }).addTo(map));
    }
</script>
</body>
</html>
