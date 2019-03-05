package com.sun.mapper.Remote;

import java.util.List;
import java.util.Map;

public interface RemoteMapper {
    List<Map> select_all(Map map);

    List<Map> list(Map map);

    int insert(Map map);

    int update(Map map);

    int delete(Map map);

    int picture_insert(Map map);
}
