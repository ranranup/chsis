package top.chsis.dao;

import java.util.List;

import top.chsis.model.Resource;

public interface IResourceMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);

	List<Resource> selectByCondition(Resource resource);
	
	List<Resource> selectAll();
	
	Resource selectByURL(String url);
	
	Resource selectByName(String name);
}