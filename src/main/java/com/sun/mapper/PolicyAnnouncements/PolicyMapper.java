package com.sun.mapper.PolicyAnnouncements;

import com.sun.pojo.PolicyModel;

import java.util.List;

public interface PolicyMapper {
    List<PolicyModel> select_all();
}
