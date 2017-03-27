package top.chsis.service;

import java.util.List;

import top.chsis.model.Community;

public interface ICommunityService {
	int deleteByPrimaryKey(String uuid);

    int insert(Community record);

    int insertSelective(Community record);

    Community selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Community record);

    int updateByPrimaryKey(Community record);

	List<Community> selectAll();
}
