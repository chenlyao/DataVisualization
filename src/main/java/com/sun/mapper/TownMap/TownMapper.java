package com.sun.mapper.TownMap;

import java.util.List;
import java.util.Map;

public interface TownMapper {
    List<Map> select_all(Map map);

    int update(Map map);
}
