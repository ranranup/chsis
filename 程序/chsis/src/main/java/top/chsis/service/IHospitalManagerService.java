package top.chsis.service;

import java.util.List;

import top.chsis.model.HospitalManager;

public interface IHospitalManagerService {

	int deleteByPrimaryKey(String uuid);

	int insert(HospitalManager hospitalManager);

	int insertSelective(HospitalManager hospitalManager);

	HospitalManager selectByPrimaryKey(String uuid);
	
	List<HospitalManager> selectByHospitalUuid(String hospitalUuid);

	int updateByPrimaryKeySelective(HospitalManager hospitalManager);

	int updateByPrimaryKey(HospitalManager hospitalManager);
	
	List<HospitalManager> selectAll();

	HospitalManager selectByManagerUuid(String managerUuid);

}
