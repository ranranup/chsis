package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.exception.RoleException;
import top.chsis.model.Role;

public interface IRoleService {
    int deleteByPrimaryKey(String uuid) throws RoleException;

    int insert(Role record) throws RoleException;

    int insertSelective(Role record) throws RoleException;

    Role selectByPrimaryKey(String uuid) throws RoleException;

    List<Role> selectAll();
    
    int updateByPrimaryKeySelective(Role record) throws RoleException;

    int updateByPrimaryKey(Role record) throws RoleException;

	PageInfo<Role> selectByConditionAndPaging(Role role, int page, int rows) throws RoleException;

	Role selectByCName(String cName) throws RoleException;
	
	Role selectByEName(String eName) throws RoleException;

	List<Role> selectCommon();
}