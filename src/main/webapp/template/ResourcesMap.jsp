<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/lib/leaflets/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/lib/leaflets/esri-leaflet/esri-leaflet.js"></script>
<script src="${pageContext.request.contextPath}/lib/leaflets/leaflet/leaflet.ChineseTmsProviders.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/leaflets/Leaflet_Plugins/Control.MiniMap.css">
<script src="${pageContext.request.contextPath}/lib/leaflets/Leaflet_Plugins/Control.MiniMap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/leaflets/MousePosition/L.Control.MousePosition.css">
<script src="${pageContext.request.contextPath}/lib/leaflets/MousePosition/L.Control.MousePosition.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/leaflets/EasyButton/easy-button.css">
<script src="${pageContext.request.contextPath}/lib/leaflets/EasyButton/easy-button.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/leaflets/fullscreen/leaflet.fullscreen.css">
<script src="${pageContext.request.contextPath}/lib/leaflets/fullscreen/Leaflet.fullscreen.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/common/urlMap.js"></script>
<script>
    /**
     * 智图地图内容
     */
    var normalm1 = L.tileLayer.chinaProvider('Geoq.Normal.Map', {
        maxZoom: 18,
        minZoom: 5
    });
    var normalm2 = L.tileLayer.chinaProvider('Geoq.Normal.Color', {
        maxZoom: 18,
        minZoom: 5
    });
    var normalm3 = L.tileLayer.chinaProvider('Geoq.Normal.PurplishBlue', {
        maxZoom: 18,
        minZoom: 5
    });
    var normalm4 = L.tileLayer.chinaProvider('Geoq.Normal.Gray', {
        maxZoom: 18,
        minZoom: 5
    });
    var normalm5 = L.tileLayer.chinaProvider('Geoq.Normal.Warm', {
        maxZoom: 18,
        minZoom: 5
    });
    var normalm6 = L.tileLayer.chinaProvider('Geoq.Normal.Cold', {
        maxZoom: 18,
        minZoom: 5
    });
    /**
     * 天地图内容
     */
    var normalm = L.tileLayer.chinaProvider('TianDiTu.Normal.Map', {
            maxZoom: 18,
            minZoom: 5
        }),
        normala = L.tileLayer.chinaProvider('TianDiTu.Normal.Annotion', {
            maxZoom: 18,
            minZoom: 5
        }),
        imgm = L.tileLayer.chinaProvider('TianDiTu.Satellite.Map', {
            maxZoom: 18,
            minZoom: 5
        }),
        imga = L.tileLayer.chinaProvider('TianDiTu.Satellite.Annotion', {
            maxZoom: 18,
            minZoom: 5
        });

    var normal = L.layerGroup([normalm, normala]),
        image = L.layerGroup([imgm, imga]);
    /**
     * 谷歌
     */
    var normalMap = L.tileLayer.chinaProvider('Google.Normal.Map', {
            maxZoom: 18,
            minZoom: 5
        }),
        satelliteMap = L.tileLayer.chinaProvider('Google.Satellite.Map', {
            maxZoom: 18,
            minZoom: 5
        });
    /**
     * 高德地图
     */
    var Gaode = L.tileLayer.chinaProvider('GaoDe.Normal.Map', {
        maxZoom: 18,
        minZoom: 5
    });
    var Gaodimgem = L.tileLayer.chinaProvider('GaoDe.Satellite.Map', {
        maxZoom: 18,
        minZoom: 5
    });
    var Gaodimga = L.tileLayer.chinaProvider('GaoDe.Satellite.Annotion', {
        maxZoom: 18,
        minZoom: 5
    });
    var Gaodimage = L.layerGroup([Gaodimgem, Gaodimga]);

    var baseLayers = {
        "智图地图": normalm1,
        "智图多彩": normalm2,
        "智图午夜蓝": normalm3,
        "智图灰色": normalm4,
        "智图暖色": normalm5,
        "智图冷色": normalm6,
        "天地图": normal,
        "天地图影像": image,
        "谷歌地图": normalMap,
        "谷歌影像": satelliteMap,
        "高德地图": Gaode,
        "高德影像": Gaodimage
    };
    var map = L.map("map", {
        center: [37.65066, 117.14035],
        zoom: 11,
        layers: [satelliteMap],
        //zoomControl: false,//放大缩小控件
        attributionControl: false,//关闭右下角标识
        editable: true//允许编辑
        , fullscreenControl: {//地图全屏
            pseudoFullscreen: false
        }
    });
    //将图层组控件添加到地图中
    L.control.layers(baseLayers, null).addTo(map);
    //比例尺
    L.control.scale({maxWidth: 200, metric: true, imperial: false}).addTo(map);
    //鹰眼图
    var miniMap = new L.Control.MiniMap(Gaode, {
        toggleDisplay: true,
        width: 150,
        height: 150,
        position: 'bottomleft'
    }).addTo(map);
    //鼠标经纬度
    L.control.mousePosition({position: 'bottomright'}).addTo(map);

    var toggle = L.easyButton({
        states: [{
            stateName: 'add-markers',
            icon: '<img src="resources/images/location.png" style="margin-top: 3px">',
            title: '复原显示框',
            onClick: function (control) {
                dingwei();
                control.state('remove-markers');
            }
        }, {
            icon: '<img src="resources/images/location_blue.png" style="margin-top: 3px">',
            stateName: '复原显示框',
            onClick: function (control) {
                dingwei();
                control.state('add-markers');
            },
            title: 'remove markers'
        }]
    });
    toggle.addTo(map);

    // 定位按钮方法
    function dingwei() {
        map.flyTo([37.65066, 117.14035], 11);
    }

    /*鼠标悬停高亮*/
    function highlight(e) {
        var layer = e.target;
        layer.setStyle({
            weight: 6,
            color: '#fff',
            fillOpacity: 0.9,
            dashArray: '0'
        })
    }

    /*鼠标移除后复原地图样式*/
    function resetHighlight(e) {
        var layer = e.target;
        layer.setStyle({
            color: '#FF0000',
            weight: 2,
            fillOpacity: 0.2
        })
    }

    /*地图点击后最大化*/
    function zoomTo(e) {
        map.fitBounds(e.target.getBounds());
    }


    /*获取行政边界*/
    function Border(name) {
        var border;
        $.ajax({
            type: 'post',
            url: 'map/GetMap.in',
            dataType: 'json',
            async: true,
            data: {
                name: name
            },
            success: function (res) {
                var a = res.data.json.value;
                a = eval('(' + a + ')');
                if (res.type == "success") {
                    border = a;
                    for (var i in border.features) {
                        A = L.geoJSON(border.features[i], {
                            style: function (feature) {
                                return {
                                    color: '#FF0000',
                                    fillOpacity: 0,
                                    weight: 2
                                }
                            }
                        }).addTo(map);
                    }
                } else {
                    alert("数据错误！");
                }
            }
        });
    }

    //获取单图层的图例
    function GetLegend(LengendUrl, name, x) {
        LengendUrl = LengendUrl + "/legend?f=pjson";
        x = x || 0;
        name = name || '施肥含量';
        if ($(".legend div") != null) {
            $(".legend div").remove()
        }
        $.ajax({
            type: "POST",
            cache: false,
            url: LengendUrl,
            async: true,
            success: function (data) {
                //字符串转换为数组
                data = eval("(" + data + ")");
                var hmts = '<div class="Lenged Lenged_css">';
                var Name = name;
                hmts += "<h5>" + Name + "<h5>";
                //添加图片注释
                console.log(x);
                for (var i = 0; i < data.layers[x].legend.length; i++) {
                    //图片
                    var image = "data:image/png;base64," + data.layers[x].legend[i].imageData;
                    //标注
                    var label = data.layers[x].legend[i].label;

                    hmts += "<div><img src=" + image + " height='20' width='20' /> " + label + "</div>"
                }
                hmts += '</div>';
                // //定义控件
                var legend = L.control({position: 'bottomright'});
                legend.onAdd = function (map) {
                    var div = L.DomUtil.create('div', 'legend div');
                    div.innerHTML += hmts;
                    return div;
                };
                legend.addTo(map);
            }
        })
    }

    $(function () {
        Border("乐陵行政边界");
    })
</script>