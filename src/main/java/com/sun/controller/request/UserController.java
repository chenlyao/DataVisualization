package com.sun.controller.request;

import com.google.gson.Gson;
import com.sun.mapper.User.UserMapper;
import com.sun.pojo.ResultModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private Gson gson;

//    /**
//     * 登录验证
//     * @param params
//     * @param session
//     * @return
//     */
//    @RequestMapping("/isLogin.in")
//    @ResponseBody
//    public String IsLogin(@RequestParam Map<String,String> params, HttpSession session){
//        ResultModel resultModel=new ResultModel();
//        Map map=userMapper.IsLogin(params);
//        if(map==null)
//        {
//            resultModel.type="error";
//        }else {
//            resultModel.data=map;
//        }
//        session.setAttribute("data",gson.toJson(resultModel));
//        return gson.toJson(resultModel);
//    }

    /**
     * 登录页面
     *
     * @param username
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/isLogin.in")
    @ResponseBody
    public String IsLogin(@Param("username") String username, @Param("password") String password, HttpSession session) {
        ResultModel resultModel = new ResultModel();
        Map map = userMapper.IsLogin(username, password);
        if (map == null) {
            resultModel.type = "error";
        } else {
            session.setAttribute("username", username);
            resultModel.data = map;
        }
        session.setAttribute("data", gson.toJson(resultModel));
        return gson.toJson(resultModel);
    }

    /**
     * 用户注册
     *
     * @param map
     * @return
     */
    @RequestMapping("/Register.in")
    @ResponseBody
    public String Register(@RequestParam Map map) {
        ResultModel resultModel = new ResultModel();
        int a = userMapper.Register(map);
        if (a == 0) {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }

    @RequestMapping("/Exit.in")
    public String exitUser(HttpSession session) {
        //清除登录信息
        session.invalidate();
        return "Login";
    }

}
