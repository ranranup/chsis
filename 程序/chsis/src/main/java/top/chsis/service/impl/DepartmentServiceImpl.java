package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.DepartmentMapper;
import top.chsis.dao.DoctorMapper;
import top.chsis.model.Department;
import top.chsis.model.Doctor;
import top.chsis.service.IDepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private DoctorMapper doctorMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		List<Doctor> doctors = doctorMapper.selectDoctorsByDepartmentUUID(uuid);
		
		if(doctors !=null && doctors.size() > 0){
			return 0;
		}else{
			return departmentMapper.deleteByPrimaryKey(uuid);
		}
		
	}

	public int insert(Department record) {
		return departmentMapper.insert(record);
	}

	public int insertSelective(Department record) {
		return departmentMapper.insertSelective(record);
	}

	public Department selectByPrimaryKey(String uuid) {
		return departmentMapper.selectByPrimaryKey(uuid);
	}

	public List<Department> selectDepartmentsByHospitalUUID(String hospitalUUID) {
		return departmentMapper.selectDepartmentsByHospitalUUID(hospitalUUID);
	}

	public int updateByPrimaryKeySelective(Department record) {
		return departmentMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Department record) {
		return departmentMapper.updateByPrimaryKey(record);
	}

	public List<Department> selectAll() {
		return departmentMapper.selectAll();
	}

	public PageInfo<Department> selectByConditionAndPaging(Department department, int page, int size) {
		PageHelper.startPage(page, size);
		List<Department> list = new ArrayList<Department>();
		list = departmentMapper.selectByCondition(department);
		PageInfo<Department> pageInfo = new PageInfo<Department>(list);
		return pageInfo;
	}

	public Department selectByNumber(String number) {
		return departmentMapper.selectByNumber(number);
	}

}
