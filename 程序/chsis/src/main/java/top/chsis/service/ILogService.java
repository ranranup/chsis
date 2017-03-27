package top.chsis.service;

import top.chsis.model.Log;

public interface ILogService {
	int deleteByPrimaryKey(String uuid);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);
}
