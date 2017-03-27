package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.exception.ResourceException;
import top.chsis.model.Resource;

public interface IResourceService {
    int deleteByPrimaryKey(String uuid) throws ResourceException;

    int insert(Resource record) throws ResourceException;

    int insertSelective(Resource record) throws ResourceException;

    Resource selectByPrimaryKey(String uuid) throws ResourceException;

    int updateByPrimaryKeySelective(Resource record) throws ResourceException;

    int updateByPrimaryKey(Resource record) throws ResourceException;

	PageInfo<Resource> selectByConditionAndPaging(Resource resource, int pageNo_mine, int len_mine) throws ResourceException;

	List<Resource> selectAll();

	Resource selectByURL(String url) throws ResourceException;
	
	Resource selectByName(String name) throws ResourceException;
}