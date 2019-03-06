package com.sun.controller.in;

import com.google.gson.Gson;
import com.sun.mapper.TownMap.TownMapper;
import com.sun.pojo.ResultModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/town")
public class TownIn {
    @Autowired
    private TownMapper townMapper;
    @Autowired
    private Gson gson;

    @RequestMapping("/select.in")
    public String select_all(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        List<Map> a = townMapper.select_all(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/get_list_length.in")
    public String get_list_length(){
        return gson.toJson(townMapper.get_list_length());
    }
}
