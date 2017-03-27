package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.IRoleResourceMapper;
import top.chsis.exception.RoleResourceException;
import top.chsis.model.RoleResource;
import top.chsis.service.IRoleResourceService;
import top.chsis.util.StringUtil;
import top.chsis.vo.RoleResourceVO;

@Service("roleResourceService")
public class RoleResourceServiceImpl implements IRoleResourceService {

	@Autowired
	private IRoleResourceMapper roleResourceMapper;
	
	public int deleteByPrimaryKey(String uuid) throws RoleResourceException {
		if(StringUtil.isNoE(uuid)) {
			throw new RoleResourceException("删除角色资源的uuid不能为空");
		}
		
		return roleResourceMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(RoleResource record) throws RoleResourceException {
		if(record == null) {
			throw new RoleResourceException("角色资源不能为null");
		}
		
		return roleResourceMapper.insert(record);
	}

	public int insertSelective(RoleResource record) throws RoleResourceException {
		if(record == null) {
			throw new RoleResourceException("角色资源不能为null");
		}
		
		return roleResourceMapper.insertSelective(record);
	}

	public RoleResource selectByPrimaryKey(String uuid) throws RoleResourceException {
		if(StringUtil.isNoE(uuid)) {
			throw new RoleResourceException("删除角色资源的uuid不能为空");
		}
		
		return roleResourceMapper.selectByPrimaryKey(uuid);
	}

	public List<RoleResource> selectAll() {
		return roleResourceMapper.selectAll();
	}

	public int updateByPrimaryKeySelective(RoleResource record) throws RoleResourceException {
		if(record == null) {
			throw new RoleResourceException("角色资源不能为null");
		}
		
		return roleResourceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(RoleResource record) throws RoleResourceException {
		if(record == null) {
			throw new RoleResourceException("角色资源不能为null");
		}
		
		return roleResourceMapper.updateByPrimaryKey(record);
	}

	public List<RoleResource> selectByRoleUuid(String roleUuid) {
		return roleResourceMapper.selectByRoleUuid(roleUuid);
	}

	public int insertBatch(List<RoleResourceVO> list) {
		return roleResourceMapper.insertBatch(list);
	}

	public int deleteBatchByUuid(List<String> list) {
		return roleResourceMapper.deleteBatchByUuid(list);
	}

}
