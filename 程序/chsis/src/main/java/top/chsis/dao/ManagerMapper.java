package top.chsis.dao;

import java.util.List;

import top.chsis.model.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    Manager selectByUserName(String userName);

	List<Manager> selectByCondition(Manager user);

}