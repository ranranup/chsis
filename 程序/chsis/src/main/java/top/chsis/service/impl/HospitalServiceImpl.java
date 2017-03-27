package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DepartmentMapper;
import top.chsis.dao.HospitalManagerMapper;
import top.chsis.dao.HospitalMapper;
import top.chsis.dao.ManagerMapper;
import top.chsis.model.Department;
import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.service.IHospitalService;

@Service("hospitalService")

public class HospitalServiceImpl implements IHospitalService{
	@Autowired
	private HospitalMapper hospitalMapper;
	
	@Autowired
	private HospitalManagerMapper hospitalManagerMapper;
	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		List<Department> departments = departmentMapper.selectDepartmentsByHospitalUUID(uuid);
		
		if(departments != null && departments.size() > 0){
			return 0;
		}else{
			List<HospitalManager> hospitalManagers = hospitalManagerMapper.selectByHospitalUuid(uuid);
			for(HospitalManager hm : hospitalManagers) {
				managerMapper.deleteByPrimaryKey(hm.getManager().getUuid());
			}
			return hospitalMapper.deleteByPrimaryKey(uuid);
		}
	}

	public int insert(Hospital record) {
		return hospitalMapper.insert(record);
	}

	public int insertSelective(Hospital record) {
		return hospitalMapper.insertSelective(record);
	}

	public Hospital selectByPrimaryKey(String uuid) {
		return hospitalMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Hospital record) {
		return hospitalMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Hospital record) {
		return hospitalMapper.updateByPrimaryKey(record);
	}

	public List<Hospital> selectAll() {
		return hospitalMapper.selectAll();
	}

	public Hospital selectByNumber(String number) {
		return hospitalMapper.selectByNumber(number);
	}

}
