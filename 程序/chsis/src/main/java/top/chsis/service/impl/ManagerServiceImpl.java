package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.HospitalManagerMapper;
import top.chsis.dao.IUserRoleMapper;
import top.chsis.dao.ManagerMapper;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.model.Role;
import top.chsis.model.UserRole;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;

@Service("managerService")
public class ManagerServiceImpl implements IManagerService {
	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Autowired
	private HospitalManagerMapper hospitalManagerMapper;
	
	@Autowired
	private IUserRoleMapper userRoleMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return managerMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Manager record) {
		UserRole ur = new UserRole();
		ur.setUuid(StringUtil.getUUID());
		ur.setUserUuid(record.getUuid());
		Integer type = record.getType();
		ur.setRole(new Role(String.valueOf(type)));
		userRoleMapper.insert(ur);
		
		return managerMapper.insert(record);
	}

	public int insertSelective(Manager record) {
		return managerMapper.insertSelective(record);
	}

	public Manager selectByPrimaryKey(String uuid) {
		return managerMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Manager record) {
		return managerMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Manager record) {
		return managerMapper.updateByPrimaryKey(record);
	}

	public int insertHospitalManager(Manager manager, HospitalManager hospitalManager) {
		int insert = managerMapper.insert(manager);
		int insert2 = hospitalManagerMapper.insert(hospitalManager);
		
		UserRole ur = new UserRole();
		ur.setUuid(StringUtil.getUUID());
		ur.setUserUuid(manager.getUuid());
		ur.setRole(new Role("0"));
		int insert3 = userRoleMapper.insert(ur);
		
		return insert + insert2 + insert3;
	}

	public Manager selectByUserName(String userName) {
		return managerMapper.selectByUserName(userName);
	}

	public int deleteByHospitalUuid(String hospitalUuid) {
		return 0;
	}

	public PageInfo<Manager> selectByConditionAndPaging(Manager user, int page, int size) {
		PageHelper.startPage(page, size);
		List<Manager> list = new ArrayList<Manager>();
		list = managerMapper.selectByCondition(user);
		PageInfo<Manager> pageInfo = new PageInfo<Manager>(list);
		return pageInfo;
	}

}
