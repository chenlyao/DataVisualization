var map_server_url="http://183.161.30.119:6081/arcgis/rest/services/";
//有机质插值
var laoling_organic=map_server_url+"laoling/ORGANIC/MapServer";
//PH值插值
var laoling_PH=map_server_url+"laoling/PH/MapServer";
//N值插值
var laoling_N=map_server_url+"laoling/N/MapServer";
//P值插值
var laoling_P=map_server_url+"laoling/P/MapServer";
//K值插值
var laoling_K=map_server_url+"laoling/K/MapServer";


//采样点地址url
var url_querypoint=map_server_url+"laoling/points/MapServer/0";

//四层方法url
var Interpolation_four=map_server_url+"laoling_server/four/GPServer/Interpolation_four";
var Interpolation_four_mapserver=map_server_url+"laoling_server/four/MapServer";
//五层方法url
var Interpolation_five=map_server_url+"laoling_server/five/GPServer/Interpolation_five";
var Interpolation_five_mapserver=map_server_url+"laoling_server/five/MapServer";