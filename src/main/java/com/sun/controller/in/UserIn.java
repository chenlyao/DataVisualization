package com.sun.controller.in;

import com.google.gson.Gson;
import com.sun.mapper.User.UserMapper;
import com.sun.pojo.ResultModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserIn {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private Gson gson;

    @RequestMapping("/SelectByUid.in")
    @ResponseBody
    public String SelectByUid(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        Map a = userMapper.SelectByUid(map);
        if (a == null) {
            resultModel.type = "error";
        } else {
            resultModel.data = a;
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/UpDataByUid.in")
    @ResponseBody
    public String UpDataByUid(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = userMapper.UpDataByUid(map);
        if (a != 0) {
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }
}
