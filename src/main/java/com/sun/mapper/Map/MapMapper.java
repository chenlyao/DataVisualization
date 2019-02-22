package com.sun.mapper.Map;

import java.util.List;
import java.util.Map;

public interface MapMapper {
    //获取乐陵市行政边界
    Map GetBorder(Map map);

    //通过uid获取两区边界
    Map GetLqByUid(Map map);

    //获取所有的两区uid
    List<Map> GetLqUid();

    //获取村界uid
    List<Map> GetVillageUid();

    //通过uid获取村界数据
    Map GetVillageByUid(Map map);

    //获取所有的乡镇uid
    List<Map> GetTownUid();

    //通过uid得到乡镇数据
    Map GetTownByUid(Map map);

    //获取村信息
    List<Map> likeList(Map map);

    //通过uid删除村
    int village_delete(Map map);

    //通过uid更新数据
    int village_update(Map map);

    //添加数据
    int village_insert(Map map);
}
