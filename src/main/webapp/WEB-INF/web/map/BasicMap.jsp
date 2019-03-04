<%--
  Created by IntelliJ IDEA.
  User: SUNG
  Date: 2019/1/27
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
    <title>map</title>
    <%@ include file="/template/ResourcesController.jsp" %>
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
    </style>
</head>
<body>
<div id="mapMain">
    <div id="map" style="width: 100%;height: 100%;z-index: 1"></div>
    <%@include file="/template/ResourcesMap.jsp" %>
    <%@include file="/template/CommonMap.jsp"%>
    <div class="btn-group text-center" role="group" style="flex-grow: 1;position: fixed;top:3%;right: 18%; z-index: 10">
        <button  type="button" class="btn btn-default" onclick="GetTownUid()">乡镇</button>
        <button  type="button" class="btn btn-default" onclick="GetVillageUid()">村界</button>
        <button  type="button" class="btn btn-default" onclick="ClearMaps()">清空</button>
    </div>
</div>
<script>

    /**************************************/
    var maps = [];

    function ClearMaps() {
        //清空地图
        for (var i = 0; i < maps.length; i++) {
            maps[i].remove();
        }
        maps.length = 0;
    }

    //获取村级的区域uid
    function GetTownUid() {
        $.ajax({
            type: 'POST',
            url: 'map/GetTownUid.in',
            dataType: 'json',
            async: 'true',
            success: function (res) {
                for (var i = 0; i < res.data.length; i++) {
                    ClearMaps();
                    DrawTown(res.data[i].uid);
                }
            }
        })
    }

    //通过uid获取村级信息
    function DrawTown(uid) {
        $.ajax({
            type: 'POST',
            url: 'map/GetTownById.in',
            dataType: 'json',
            async: 'true',
            data: {
                uid: uid
            },
            success: function (res) {
                var border = eval('(' + res.data.border.value + ')');
                var htms;
                htms = "<div class='table' style='height: 30px'><ul><li><a>";
                maps.push(L.geoJSON(border.geometry, {
                    style: function (feature) {
                        return {
                            color: '#FF0000',
                            fillOpacity: 0.2,
                            weight: 1
                        }
                    }
                }).bindPopup(function (layer) {
                    return htms + border.properties.XJQYMC + "</a></li></ul>";
                }).on({
                    mouseover: highlight, //鼠标移动上去高亮
                    mouseout: resetHighlight, //鼠标移出恢复原样式
                    click: zoomTo //点击最大化
                }).addTo(map));
            }
        })
    }

    //获取村级的区域uid
    function GetVillageUid() {
        $.ajax({
            type: 'POST',
            url: 'map/GetVillageUid.in',
            dataType: 'json',
            async: 'true',
            success: function (res) {
                for (var i = 0; i < res.data.length; i++) {
                    ClearMaps();
                    DrawVillage(res.data[i].uid);
                }
            }
        })
    }

    //通过uid获取村级信息
    function DrawVillage(uid) {
        $.ajax({
            type: 'POST',
            url: 'map/GetVillageById.in',
            dataType: 'json',
            async: 'true',
            data: {
                uid: uid
            },
            success: function (res) {
                var border = eval('(' + res.data.border.value + ')');
                var htms;
                htms = "<div class='table' style='height: 30px'><ul><li><a>";
                maps.push(L.geoJSON(border.geometry, {
                    style: function (feature) {
                        return {
                            color: '#FF0000',
                            fillOpacity: 0.2,
                            weight: 1
                        }
                    }
                }).bindPopup(function (layer) {
                    return htms + border.properties.CJQYMC + "</a></li></ul>";
                }).on({
                    mouseover: highlight, //鼠标移动上去高亮
                    mouseout: resetHighlight, //鼠标移出恢复原样式
                    click: zoomTo //点击最大化
                }).addTo(map));
            }
        })
    }

</script>
</body>
</html>
