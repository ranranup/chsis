package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.HospitalManagerMapper;
import top.chsis.model.HospitalManager;
import top.chsis.service.IHospitalManagerService;

@Service("hospitalManagerService")
public class HospitalManagerServiceImpl implements IHospitalManagerService {

	@Autowired
	private HospitalManagerMapper hospitalManagerMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return hospitalManagerMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(HospitalManager record) {
		return hospitalManagerMapper.insert(record);
	}

	public int insertSelective(HospitalManager record) {
		return hospitalManagerMapper.insertSelective(record);
	}

	public HospitalManager selectByPrimaryKey(String uuid) {
		return hospitalManagerMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(HospitalManager record) {
		return hospitalManagerMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(HospitalManager record) {
		return hospitalManagerMapper.updateByPrimaryKey(record);
	}

	public List<HospitalManager> selectAll() {
		return hospitalManagerMapper.selectAll();
	}

	public List<HospitalManager> selectByHospitalUuid(String hospitalUuid) {
		return hospitalManagerMapper.selectByHospitalUuid(hospitalUuid);
	}

	public HospitalManager selectByManagerUuid(String managerUuid) {
		return hospitalManagerMapper.selectByManagerUuid(managerUuid);
	}

}
