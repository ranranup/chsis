package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.IUserRoleMapper;
import top.chsis.exception.UserRoleException;
import top.chsis.model.UserRole;
import top.chsis.service.IUserRoleService;
import top.chsis.util.StringUtil;
import top.chsis.vo.UserRoleVO;

@Service("userRoleService")
public class UserRoleServiceImpl implements IUserRoleService {

	@Autowired
	private IUserRoleMapper userRoleMapper;
	
	public int deleteByPrimaryKey(String uuid) throws UserRoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserRoleException("删除用户角色的uuid不能为空");
		}
		
		return userRoleMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.insert(record);
	}

	public int insertSelective(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.insertSelective(record);
	}

	public UserRole selectByPrimaryKey(String uuid) throws UserRoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserRoleException("用户角色的uuid不能为空");
		}
		
		return userRoleMapper.selectByPrimaryKey(uuid);
	}

	public List<UserRole> selectRolesByUserUuid(String userUuid) throws UserRoleException {
		if(StringUtil.isNoE(userUuid)) {
			throw new UserRoleException("用户的uuid不能为空");
		}
		
		return userRoleMapper.selectRolesByUserUuid(userUuid);
	}

	public int updateByPrimaryKeySelective(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.updateByPrimaryKey(record);
	}

	public int insertBatchByUserRoleVO(List<UserRoleVO> list) {
		return userRoleMapper.insertBatchByUserRoleVO(list);
	}

	public int deleteBatchByUuid(List<String> list) {
		return userRoleMapper.deleteBatchByUuid(list);
	}

	public List<UserRole> selectCommonRolesByUserUuid(String managerUuid) {
		return userRoleMapper.selectCommonRolesByUserUuid(managerUuid);
	}

}
