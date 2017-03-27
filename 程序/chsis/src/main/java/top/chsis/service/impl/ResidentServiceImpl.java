package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.FamilyMapper;
import top.chsis.dao.IUserRoleMapper;
import top.chsis.dao.ResidentMapper;
import top.chsis.model.Family;
import top.chsis.model.Resident;
import top.chsis.model.Role;
import top.chsis.model.UserRole;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;
import top.chsis.vo.ResidentVO;

@Service("residentService")
public class ResidentServiceImpl implements IResidentService {
	
	@Autowired
	private ResidentMapper residentMapper;
	
	@Autowired
	private FamilyMapper familyMapper;
	
	@Autowired
	private IUserRoleMapper userRoleMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		int result = residentMapper.deleteByPrimaryKey(uuid);
		return result;
	}

	public int insert(Resident record) {
		return residentMapper.insert(record);
	}

	public int insertSelective(Resident record) {
		return residentMapper.insertSelective(record);
	}

	public Resident selectByPrimaryKey(String uuid) {
		return residentMapper.selectByPrimaryKey(uuid);
	}

	public List<Resident> selectResidentsByFamilyUUID(String familyUUID) {
		return residentMapper.selectResidentsByFamilyUUID(familyUUID);
	}

	public int updateByPrimaryKeySelective(Resident record) {
		return residentMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Resident record) {
		return residentMapper.updateByPrimaryKey(record);
	}

	public PageInfo<ResidentVO> selectByConditionAndPaging(ResidentVO residentVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<ResidentVO> list = new ArrayList<ResidentVO>();
		list = residentMapper.selectByCondition(residentVO);
		PageInfo<ResidentVO> pageInfo = new PageInfo<ResidentVO>(list);
		return pageInfo;
	}

	public Resident selectByUserName(String userName) {
		return residentMapper.selectByUserName(userName);
	}

	public List<Resident> selectAll() {
		return residentMapper.selectAll();
	}

	public List<ResidentVO> selectByDimIdNo(String idNo) {
		return residentMapper.selectByDimIdNo(idNo);
	}

	public Resident selectByIdNo(String idNo) {
		return residentMapper.selectByIdNo(idNo);
	}

	public int insertResident(Resident resident) {
		//新建居民时，把用户和角色的资源表也插进去
		UserRole userRole = new UserRole(StringUtil.getUUID(), resident.getUuid(), new Role("4"));
		
		//插入居民时，为居民赋予系统角色-居民：ROLE_resident
		int insert = residentMapper.insertSelective(resident) + userRoleMapper.insert(userRole);
		return insert;
	}

	public int insertResidentAndFamily(Resident resident, Family family) {
		//新建居民时，把用户和角色的资源表也插进去
		UserRole role_resident = new UserRole(StringUtil.getUUID(), resident.getUuid(), new Role("4"));
		UserRole role_householder = new UserRole(StringUtil.getUUID(), resident.getUuid(), new Role("5"));
		
		//插入居民时，为居民赋予系统角色-居民：ROLE_resident，同时插入家庭表
		int insert = residentMapper.insert(resident) + 
					 familyMapper.insert(family) + 
					 userRoleMapper.insert(role_resident) +
					 userRoleMapper.insert(role_householder);
		return insert;
	}

	public int removeMemberByPrimaryKey(String uuid) {
		return residentMapper.removeMemberByPrimaryKey(uuid);
	}
}
