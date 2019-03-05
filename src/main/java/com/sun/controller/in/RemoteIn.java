package com.sun.controller.in;

import com.google.gson.Gson;
import com.sun.mapper.Remote.RemoteMapper;
import com.sun.pojo.ResultModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/remote")
public class RemoteIn {
    @Autowired
    private RemoteMapper remoteMapper;

    @Autowired
    public Gson gson;

    @RequestMapping("/select_all.in")
    public String select_all(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        List<Map> a = remoteMapper.select_all(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/list.in")
    public String list(@RequestParam Map map) {
        Integer page = Integer.parseInt((String) map.get("page"));
        Integer limit = Integer.parseInt((String) map.get("limit"));
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        ResultModel resultModel = new ResultModel();
        List<Map> a = remoteMapper.list(map);
        if (a != null) {
            resultModel.data = a;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/insert.in")
    public String insert(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = remoteMapper.insert(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/insert_picture.in")
    public String insert_picture(@RequestParam Map map) {
        String uid = UUID.randomUUID().toString();
        map.put("uid", uid);
        remoteMapper.picture_insert(map);
        return gson.toJson(uid);
    }

    @RequestMapping("/update.in")
    public String update(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = remoteMapper.update(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/delete.in")
    public String delete(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = remoteMapper.delete(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/get_list_length.in")
    public String get_list_length() {
        return gson.toJson(remoteMapper.get_list_length());
    }

}
