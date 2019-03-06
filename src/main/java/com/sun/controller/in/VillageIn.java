package com.sun.controller.in;

import com.google.gson.Gson;
import com.sun.mapper.Map.MapMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("village")
public class VillageIn {
    @Autowired
    private MapMapper mapMapper;

    @Autowired
    private Gson gson;

    @RequestMapping("/get_village_length.in")
    public String get_village_length(){
        return gson.toJson(mapMapper.get_village_length());
    }
}
