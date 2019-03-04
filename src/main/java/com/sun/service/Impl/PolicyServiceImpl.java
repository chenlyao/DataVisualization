package com.sun.service.Impl;

import com.sun.mapper.PolicyAnnouncements.PolicyMapper;
import com.sun.pojo.PolicyModel;
import com.sun.service.PolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PolicyServiceImpl implements PolicyService {
    @Autowired
    private PolicyMapper policyMapper;

    @Override
    public List<PolicyModel> select_all(){
       return policyMapper.select_all();
    }
}
