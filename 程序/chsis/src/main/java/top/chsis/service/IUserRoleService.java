package top.chsis.service;

import java.util.List;

import top.chsis.exception.UserRoleException;
import top.chsis.model.UserRole;
import top.chsis.vo.UserRoleVO;

public interface IUserRoleService {
    int deleteByPrimaryKey(String uuid) throws UserRoleException;

    int insert(UserRole record) throws UserRoleException;

    int insertSelective(UserRole record) throws UserRoleException;

    UserRole selectByPrimaryKey(String uuid) throws UserRoleException;
    
    List<UserRole> selectRolesByUserUuid(String userUuid) throws UserRoleException;

    int updateByPrimaryKeySelective(UserRole record) throws UserRoleException;

    int updateByPrimaryKey(UserRole record) throws UserRoleException;
    
    int insertBatchByUserRoleVO(List<UserRoleVO> list);
    
    int deleteBatchByUuid(List<String> list);

	List<UserRole> selectCommonRolesByUserUuid(String managerUuid);

}