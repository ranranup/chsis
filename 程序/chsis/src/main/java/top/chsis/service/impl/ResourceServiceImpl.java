package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.IResourceMapper;
import top.chsis.exception.ResourceException;
import top.chsis.model.Resource;
import top.chsis.service.IResourceService;
import top.chsis.util.StringUtil;

@Service("resourceService")
public class ResourceServiceImpl implements IResourceService {

	@Autowired
	private IResourceMapper resourceMapper;
	
	public int deleteByPrimaryKey(String uuid) throws ResourceException {
		if(StringUtil.isNoE(uuid)) {
			throw new ResourceException("删除资源的uuid不能为空");
		}
		
		return resourceMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Resource record) throws ResourceException {
		if(record == null) {
			throw new ResourceException("资源不能为null");
		}
		
		return resourceMapper.insert(record);
	}

	public int insertSelective(Resource record) throws ResourceException {
		if(record == null) {
			throw new ResourceException("资源不能为null");
		}
		
		return resourceMapper.insertSelective(record);
	}

	public Resource selectByPrimaryKey(String uuid) throws ResourceException {
		if(StringUtil.isNoE(uuid)) {
			throw new ResourceException("删除资源的uuid不能为空");
		}
		
		return resourceMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Resource record) throws ResourceException {
		if(record == null) {
			throw new ResourceException("资源不能为null");
		}
		
		return resourceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Resource record) throws ResourceException {
		if(record == null) {
			throw new ResourceException("资源不能为null");
		}
		
		return resourceMapper.updateByPrimaryKey(record);
	}

	public PageInfo<Resource> selectByConditionAndPaging(Resource resource, int page, int rows) throws ResourceException {
		PageHelper.startPage(page, rows);
		List<Resource> list = new ArrayList<Resource>();
		try {
			list = resourceMapper.selectByCondition(resource);
		} catch (Exception e) {
			throw new ResourceException("查询资源出错！");
		}
		PageInfo<Resource> pageInfo=new PageInfo<Resource>(list);
		return pageInfo;
	}

	public List<Resource> selectAll() {
		return resourceMapper.selectAll();
	}

	public Resource selectByURL(String url) throws ResourceException {
		Resource resource = null;
		try {
			resource = resourceMapper.selectByURL(url);
		} catch (Exception e) {
			throw new ResourceException("查询资源出错！");
		}
		return resource;
	}

	public Resource selectByName(String name) throws ResourceException {
		Resource resource = null;
		try {
			resource = resourceMapper.selectByName(name);
		} catch (Exception e) {
			throw new ResourceException("查询资源出错！");
		}
		return resource;
	}

}
