package com.sun.mapper.User;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

public interface UserMapper {
    Map IsLogin(@Param("username") String username,@Param("password") String password);

    int Register(Map map);

    Map SelectByUid(Map map);

    int UpDataByUid(Map map);
}
