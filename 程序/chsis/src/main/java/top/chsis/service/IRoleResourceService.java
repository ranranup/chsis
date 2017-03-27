package top.chsis.service;

import java.util.List;

import top.chsis.exception.RoleResourceException;
import top.chsis.model.RoleResource;
import top.chsis.vo.RoleResourceVO;

public interface IRoleResourceService {
    int deleteByPrimaryKey(String uuid) throws RoleResourceException;

    int insert(RoleResource record) throws RoleResourceException;

    int insertSelective(RoleResource record) throws RoleResourceException;

    RoleResource selectByPrimaryKey(String uuid) throws RoleResourceException;

    List<RoleResource> selectAll();
    
    int updateByPrimaryKeySelective(RoleResource record) throws RoleResourceException;

    int updateByPrimaryKey(RoleResource record) throws RoleResourceException;

	List<RoleResource> selectByRoleUuid(String roleUuid);
	
	int insertBatch(List<RoleResourceVO> list);
    
    int deleteBatchByUuid(List<String> list);
}