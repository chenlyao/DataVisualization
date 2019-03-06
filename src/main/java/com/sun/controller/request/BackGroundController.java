package com.sun.controller.request;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackGroundController {
    /**
     * 后台管理界面
     *
     * @return
     */
    @RequestMapping("/BackGround.net")
    public String BackGround(String username, Model model) {
        model.addAttribute("username", username);
        return "background/BG_main";
    }

    /**
     * 用户管理界面
     *
     * @return
     */
    @RequestMapping("/UserManagement.net")
    public String UserManagement(String uid, Model model) {
        model.addAttribute("uid", uid);
        return "UserManagement";
    }

    /**
     * 村级数据管理
     *
     * @return
     */
    @RequestMapping("/VillageDataManagement.net")
    public String VillageDataManagement() {
        return "page/VillageDataManagement";
    }

    /**
     * 遥感数据管理
     * @return
     */
    @RequestMapping("/RemoteDataManagement.net")
    public String RemoteDataManagement(){return "page/RemoteDataManagement";}

    @RequestMapping("/TownDataManagement.net")
    public String TownDataManagement(){return "page/TownDataManagement";}
}
