package com.sun.controller.request;

import com.google.gson.Gson;
import com.sun.mapper.Map.MapMapper;
import com.sun.pojo.ResultModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/map")
public class MapController {
    @Autowired
    private MapMapper mapMapper;
    @Autowired
    private Gson gson;

    /**
     * 获取GeoJson数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/GetMap.in")
    @ResponseBody
    public String MapBorder(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        Map a = mapMapper.GetBorder(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 获取单个两区的边界
     *
     * @param map
     * @return
     */
    @RequestMapping("/LqList.in")
    @ResponseBody
    public String GetBorderById(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        Map a = mapMapper.GetLqByUid(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 获取两区uid数据
     *
     * @return
     */
    @RequestMapping("/GetLqUid.in")
    @ResponseBody
    public String GetUid() {
        ResultModel resultModel = new ResultModel();
        resultModel.data = mapMapper.GetLqUid();
        return gson.toJson(resultModel);
    }

    /**
     * 获取村界uid数据
     *
     * @return
     */
    @RequestMapping("/GetVillageUid.in")
    @ResponseBody
    public String GetVillageUid() {
        ResultModel resultModel = new ResultModel();
        resultModel.data = mapMapper.GetVillageUid();
        return gson.toJson(resultModel);
    }

    /**
     * 获取村级边界byUID
     *
     * @param map
     * @return
     */
    @RequestMapping("/GetVillageById.in")
    @ResponseBody
    public String GetVillage(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        Map a = mapMapper.GetVillageByUid(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 获取乡镇的uid
     *
     * @return
     */
    @RequestMapping("/GetTownUid.in")
    @ResponseBody
    public String GetTownUid() {
        ResultModel resultModel = new ResultModel();
        resultModel.data = mapMapper.GetTownUid();
        return gson.toJson(resultModel);
    }

    /**
     * 获取乡镇的边界数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/GetTownById.in")
    @ResponseBody
    public String GetTownById(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        Map a = mapMapper.GetTownByUid(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 获取村级数据
     *
     * @param map
     * @return
     */
    @RequestMapping("/GetVillageList.in")
    @ResponseBody
    public String GetVillageList(@RequestParam Map map) {
        Integer page = Integer.parseInt((String) map.get("page"));
        Integer limit = Integer.parseInt((String) map.get("limit"));
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        ResultModel resultModel = new ResultModel();
        List<Map> a = mapMapper.likeList(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 通过uid删除村
     *
     * @param map
     * @return
     */
    @RequestMapping("/DeleteVillage.in")
    @ResponseBody
    public String DeleteVillage(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = mapMapper.village_delete(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 通过uid更新村信息
     *
     * @param map
     * @return
     */
    @RequestMapping("/UpdateVillage.in")
    @ResponseBody
    public String UpdateVillage(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = mapMapper.village_update(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    /**
     * 新增村信息
     *
     * @param map
     * @return
     */
    @RequestMapping("/InsertVillage.in")
    @ResponseBody
    public String InsertVillage(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = mapMapper.village_insert(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

}
