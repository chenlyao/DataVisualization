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
    <title>土壤墒情</title>
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
    </style>
</head>
<body>
<div>
    <div id="map"></div>
    <%@include file="/template/ResourcesMap.jsp" %>
    <div id="main" class="btn-group" role="group" style="flex-grow: 1;position: fixed;top:3%;right: 18%; z-index: 10">
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                土壤元素
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li @click="clickButton(PH)"><a href="#">PH</a></li>
                <li @click="clickButton(Organic)"><a href="#">有机质</a></li>
                <li @click="clickButton(N)"><a href="#">N</a></li>
                <li @click="clickButton(P)"><a href="#">P</a></li>
                <li @click="clickButton(K)"><a href="#">K</a></li>
            </ul>
        </div>
        <button type="button" class="btn btn-default" @click="clear">清空</button>
    </div>
</div>
<script>
    var maps = [];

    function ClearMaps() {
        //清空地图
        for (var i = 0; i < maps.length; i++) {
            maps[i].remove();
        }
        maps.length = 0;
    }

    function getmap(url) {
        ClearMaps();
        maps.push(new L.esri.dynamicMapLayer({
            url: url,
            opacity: 0.75,
            layers: [1]
        }).addTo(map));
    }

    var control = new Vue({
        el: '#main',
        data: {
            PH: {
                url: laoling_PH,
                name: 'PH插值分布',
                coverage: 1
            },
            Organic: {
                url: laoling_organic,
                name: '有机质插值分布',
                coverage: 1
            },
            N: {
                url: laoling_N,
                name: '氮插值分布',
                coverage: 1
            },
            P: {
                url: laoling_P,
                name: '磷插值分布',
                coverage: 1
            },
            K: {
                url: laoling_K,
                name: '钾插值分布',
                coverage: 1
            }
        },
        methods: {
            clickButton: function (data) {
                getmap(data.url);
                GetLegend(data.url, data.name, data.coverage);
            },
            clear: function () {
                ClearMaps();
                if ($(".legend div") != null) {
                    $(".legend div").remove()
                }
            }
        }
    })
</script>
</body>
</html>
