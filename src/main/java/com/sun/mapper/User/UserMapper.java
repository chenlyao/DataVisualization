package com.sun.mapper.User;

import java.util.Map;

public interface UserMapper {
    Map IsLogin(Map map);

    int Register(Map map);

    Map SelectByUid(Map map);

    int UpDataByUid(Map map);
}
