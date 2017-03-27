package top.chsis.dao;

import java.util.List;

import top.chsis.model.Role;

public interface IRoleMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String uuid);
    
    List<Role> selectAll();

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectByCondition(Role role);
    
    Role selectByCName(String cName);
    
    Role selectByEName(String eName);
    
    List<Role> selectCommon();
    
}