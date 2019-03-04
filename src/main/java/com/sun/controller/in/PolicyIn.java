package com.sun.controller.in;

import com.google.gson.Gson;
import com.sun.pojo.PolicyModel;
import com.sun.pojo.ResultModel;
import com.sun.service.PolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/policy")
public class PolicyIn {
    @Autowired
    private PolicyService policyService;
    @Autowired
    private Gson gson;

    @RequestMapping("/select_all")
    @ResponseBody
    public String select_all() {
        ResultModel resultModel = new ResultModel();
        List<PolicyModel> data = policyService.select_all();
        if (data != null) {
            resultModel.data = data;
        } else {
            resultModel.type = "error";
        }
        return gson.toJson(resultModel);
    }
}
