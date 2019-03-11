package com.sun.controller.request;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {
    /**
     * 登录界面
     *
     * @return
     */
    @RequestMapping("/Login")
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


    @RequestMapping("/Error.net")
    public String Error(){
        return "Error";
    }

}
