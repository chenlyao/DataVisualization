package com.sun.controller.request;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class PageController {
    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping("/")
    public String Login() {
        return "Login";
    }

    /**
     * 注册界面
     *
     * @return
     */
    @RequestMapping("/Register.net")
    public String Register() {
        return "Register";
    }

    /**
     * 主界面
     *
     * @return
     */
    @RequestMapping("/main.net")
    public String Main() {
        return "Main";
    }

    /**
     * 基础地图
     *
     * @return
     */
    @RequestMapping("/BasicMap.net")
    public String Map() {
        return "map/BasicMap";
    }

    /**
     * 土壤墒情
     *
     * @return
     */
    @RequestMapping("/SoilMoistureMap.net")
    public String SoilMoistureMap() {
        return "map/SoilMoistureMap";
    }

    /**
     * 测土配方
     *
     * @return
     */
    @RequestMapping("/SoilTestMap.net")
    public String SoilTestMap() {
        return "map/SoilTestMap";
    }

    /**
     * 遥感监测
     *
     * @return
     */
    @RequestMapping("/RemoteSensingMap.net")
    public String RemoteSensingMap() {
        return "map/RemoteSensingMap";
    }

    /**
     * 数据管理
     *
     * @return
     */
    @RequestMapping("/VillageDataManagement.net")
    public String DataManagement() {
        return "page/VillageDataManagement";
    }

    /**
     * 后台管理界面
     *
     * @return
     */
    @RequestMapping("/BackGround.net")
    public String BackGround(String username, Model model) {
        model.addAttribute("username",username);
        return "background/BG_main";
    }

    /**
     * 用户管理界面
     * @return
     */
    @RequestMapping("/UserManagement.net")
    public String UserManagement(String uid,Model model){
        model.addAttribute("uid",uid);
        return "UserManagement";
    }
}
