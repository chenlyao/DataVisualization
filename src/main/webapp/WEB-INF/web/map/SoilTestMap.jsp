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
    <title>测土配方</title>
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
    <div class="btn-group text-center" role="group" style="flex-grow: 1;position: fixed;top:3%;right: 18%; z-index: 10">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ModalTwo">测土配方卡</button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#ModalOne">元素地图计算</button>
        <button type="button" class="btn btn-default" onclick="ClearMaps()">清空</button>
    </div>
    <!-- 模态框（Modal） -->
    <%--测土配方计算--%>
    <div class="modal fade" id="ModalTwo" tabindex="-1" role="dialog" aria-labelledby="ModalTwoLabel"
         aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="ModalTwoLabel">
                        测土配方计算器
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">元素选择:</label>
                            <div class="col-sm-10" id="ctpf-radio">
                                <label class="radio-inline">
                                    <input type="radio" name="ctpfcount" value="N"
                                           checked> 氮
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="ctpfcount" value="P">
                                    磷
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="ctpfcount" value="K">
                                    钾
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">作物选择:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="ctpf-Select">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tableInput" class="col-sm-2 control-label" >土地元素含量:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="ctpf-radioinput"
                                       placeholder="土地元素含量mg/kg">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tableInput" class="col-sm-2 control-label" >预计产量:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="ctpf-Input"
                                       placeholder="请输入预计产量kg/亩">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tableInput" class="col-sm-2 control-label">结果输出:</label>
                            <div class="col-sm-10">
                                <output class="form-control" id="result"></output>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="count_ctpf()">
                        计算
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <%--元素地图计算--%>
    <div class="modal fade" id="ModalOne" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        土壤施肥量计算
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">元素选择:</label>
                            <div class="col-sm-10" id="Radio">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="N"
                                           checked> 氮
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="P">
                                    磷
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" value="K">
                                    钾
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">作物选择:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="mySelect">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tableInput" class="col-sm-2 control-label">预计产量:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="tableInput"
                                       placeholder="请输入预计产量kg/亩">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="Button" onclick="count_gp();">
                        计算元素
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<%--query功能--%>
<link rel="stylesheet" type="text/css"
      href="http://arcgisjs.aheagle.com:1080/arcgis_js_api/library/3.17/3.17/esri/css/esri.css"/>
<script type="text/javascript"
        src="http://arcgisjs.aheagle.com:1080/arcgis_js_api/library/3.17/3.17/init.js"></script>
<%--作物种类--%>
<script src="lib/common/crop.js"></script>
<%--作物计算方法--%>
<script src="lib/common/trpf.js"></script>
<script>
    //存放元素图层的数组
    var maps = [];
    var gpUrl;
    var mapServer;

    //作物选择(控制下拉框)
    function ctpf_select() {
        $("#mySelect option").remove();
        var check = $('input[name="gender"]:checked').val();
        if (check == "N") {
            var str = "";
            for (var i = 0; i < dataone.length; i++) {
                str += "<option value='" + dataone[i].value + "'>" + dataone[i].name + "</option>";
            }
            $("#mySelect").append(str);
        } else if (check == "P") {
            var str = "";
            for (var i = 0; i < datatwo.length; i++) {
                str += "<option value='" + datatwo[i].value + "'>" + datatwo[i].name + "</option>";
            }
            $("#mySelect").append(str);
        } else if (check == "K") {
            var str = "";
            for (var i = 0; i < datathree.length; i++) {
                str += "<option value='" + datathree[i].value + "'>" + datathree[i].name + "</option>";
            }
            $("#mySelect").append(str);
        }
    }

    /*选择GP服务*/
    function GP_choice(data) {
        console.log(data);
        if (data >= 38) {
            gpUrl = Interpolation_five;
            mapServer = Interpolation_five_mapserver;
        } else {
            gpUrl = Interpolation_four;
            mapServer = Interpolation_four_mapserver;
        }
    }

    //GP执行计算
    function count_gp() {
        var a = [];
        a.IDWZ = $('input[name="gender"]:checked').val();//获取元素值
        a.Production = $("#tableInput").val();
        var b = $("#mySelect").val();//作物
        var c = reclassification(a.IDWZ, b);
        GP_choice(c.Reclassification.length);
        // console.log(c.Reclassification);
        // console.log(c.Reclassification.length);
        // console.log(c.need);
        a.Reclassification = c.Reclassification;
        a.need = c.need;
        // console.log(a);
        DTcount(a);
    }

    /*测土配方地图方法*/

    //元素地图计算
    function DTcount(data) {
        $("#Button").attr("disabled", true);
        $("#Button").html('loading...');
        console.log(gpUrl);
        var a = [];
        a = data;
        ClearMaps();
        /*清除图例*/
        if ($(".legend div") != null) {
            $(".legend div").remove()
        }
        var query = new esri.tasks.Query();//定义查询对象
        //采样点查询地址
        var queryTask = new esri.tasks.QueryTask(url_querypoint);
        //返回几何对象
        query.returnGeometry = true;
        //判断条件，必须，一般选择FID >-1即可
        query.where = "FID >-1";
        //查询出来的字段，用于插值的，要保证是数字类型
        query.outFields = [a.IDWZ];
        //查询出来的时候空间参考定义
        query.outSpatialReference = {"wkid": 4326};
        //执行采样点查询方法，query是参数，function是成功后调用的方法
        //console.log(query);
        queryTask.execute(query, function (fs) {
            //将返回的几何点数据传输给featureSet
            //将数据的格式转换为json
            var featureSet = JSON.stringify(fs);
            console.log(featureSet);
            //创建GP服务的参数
            var params = {
                IDWinput: featureSet, //Points是GP的输入参数名称，要和GP服务一直
                IDWZ: a.IDWZ,//插值的字段，名称要和GP一致
                Reclassification: a.Reclassification,
                Production: a.Production ^ 0.95,
                need: a.need
            };
            submitJob(params);//改函数为异步执行函数，用于执行长时间的服务

        })
    }

    //GP服务调用
    function submitJob(params) {
        $.ajax({
            type: 'POST',
            cache: false,
            url: gpUrl + '/submitJob?f=json',//异步请求的样式
            dataType: 'json',
            async: true,
            data: params,
            success: function (result) {
                var jobId = result.jobId;
                //alert(jobId);
                if (jobId) {//jobId是ArcGIS给添加上去的工作编号，每次向服务器发送请求的时候就会生成
                    Getresult(jobId);//获取结果
                }
            }
        });
    }

    //获取结果(判断是否有结果)
    function Getresult(jobId) {//将jobId传入方法
        $.ajax({
            type: "POST",
            cache: false,
            url: gpUrl + "/jobs/" + jobId + "?f=json",//判断是否生成结果
            async: true,
            success: function (result) {
                result = eval("(" + result + ")");
                if (result.jobStatus === "esriJobSucceeded") {//如果发送请求后的返回值的状态为esriJobSucceeded，说明已经完成操作并生成了结果
                    showResult(jobId);//展示结果
                } else {
                    //延迟执行方法
                    setTimeout(function () {
                        Getresult(jobId);
                    }, 1000);
                }
            }
        });
    }

    //展示地图结果
    function showResult(jobId) {
        var mapurl = mapServer + "/jobs/" + jobId;//这里是结果所放置的位置
        var envLayer = new L.esri.dynamicMapLayer({url: mapurl, opacity: 0.85, useCors: false});//新建动态图层
        maps.push(envLayer);
        map.addLayer(envLayer);//加入地图
        GetLegend(mapurl);//加载图例
        $("#Button").attr("disabled", false);
        $("#Button").html('计算元素');
    }

    function ClearMaps() {
        //清空地图
        for (var i = 0; i < maps.length; i++) {
            maps[i].remove();
        }
        maps.length = 0;
        if ($(".legend div") != null) {
            $(".legend div").remove()
        }
    }

    //等待加载完后执行
    $(function () {
        //通过元素种类选择作物种类
        ctpf_select();
        $("#Radio").change(function () {
            ctpf_select();
        });
        Select();
        $("#ctpf-radio").change(function () {
            Select();
        })
    });
    /**********************************************************************/
    //测图配方计算作物选择
    function Select() {
        $("#ctpf-Select option").remove();
        var check = $('input[name="ctpfcount"]:checked').val();
        if (check == "N") {
            var str = "";
            for (var i = 0; i < dataone.length; i++) {
                str += "<option value='" + dataone[i].value + "'>" + dataone[i].name + "</option>";
            }
            $("#ctpf-Select").append(str);
        } else if (check == "P") {
            var str = "";
            for (var i = 0; i < datatwo.length; i++) {
                str += "<option value='" + datatwo[i].value + "'>" + datatwo[i].name + "</option>";
            }
            $("#ctpf-Select").append(str);
        } else if (check == "K") {
            var str = "";
            for (var i = 0; i < datathree.length; i++) {
                str += "<option value='" + datathree[i].value + "'>" + datathree[i].name + "</option>";
            }
            $("#ctpf-Select").append(str);
        }
    }

    //执行计算
    function count_ctpf() {
        var a = $('input[name="ctpfcount"]:checked').val();//获取元素值
        console.log(a);
        var b = $("#ctpf-radioinput").val();//获取土壤元素含量
        console.log(b);
        var c = $("#ctpf-Select").val();//作物
        console.log(c);
        var d = $("#ctpf-Input").val();//获取预计产量
        console.log(d);
        var result = SoilFormula(a, b, c, d);
        console.log(result);
        $("#result").html(result / 100 + "kg");
    }

</script>
</body>
</html>
