package top.chsis.dao;

import java.util.List;

import top.chsis.model.UserRole;
import top.chsis.vo.UserRoleVO;


public interface IUserRoleDao {
    int deleteByPrimaryKey(String uuid);

    int insert(UserRole record);
    
    void insertBatch(List<UserRole> userRoles);
    
    int insertBatchByUserRoleVO(List<UserRoleVO> list);
    
    int deleteBatchByUuid(List<String> list);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String uuid);
    
    List<UserRole> selectRolesByUserUuid(String userUuid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
  
}