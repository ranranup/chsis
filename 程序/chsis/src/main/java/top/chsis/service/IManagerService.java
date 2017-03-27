package top.chsis.service;

import com.github.pagehelper.PageInfo;

import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;

public interface IManagerService {
	int deleteByPrimaryKey(String uuid);
	
    int insert(Manager record);

    int insertHospitalManager(Manager manager, HospitalManager hospitalManager);
    
    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

	Manager selectByUserName(String userName);

	PageInfo<Manager> selectByConditionAndPaging(Manager user, int page, int size);
}
