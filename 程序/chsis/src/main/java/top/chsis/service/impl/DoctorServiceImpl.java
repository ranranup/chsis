package top.chsis.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.DoctorMapper;
import top.chsis.dao.IUserRoleMapper;
import top.chsis.dao.MedicalRecordMapper;
import top.chsis.model.Doctor;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Role;
import top.chsis.model.UploadObject;
import top.chsis.model.UserRole;
import top.chsis.service.IDoctorService;
import top.chsis.util.StringUtil;
import top.chsis.util.UploadUtil;
import top.chsis.vo.DoctorVO;

@Service("doctorService")
public class DoctorServiceImpl implements IDoctorService {
	@Autowired
	private DoctorMapper doctorMapper;
	
	@Autowired
	private MedicalRecordMapper medicalRecordMapper;
	
	@Autowired
	private IUserRoleMapper userRoleMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		List<MedicalRecord> medicalRecords = medicalRecordMapper.selectMedicalRecordsByDoctorUUID(uuid);
		if(medicalRecords != null && medicalRecords.size() > 0){
			return 0;
		}else{
			return doctorMapper.deleteByPrimaryKey(uuid);
		}
	}

	public int insert(Doctor doctor, UploadObject uo) throws Exception {
		int result = doctorMapper.insert(doctor);
		String msg = null;
		try {
			msg = UploadUtil.uploadImage(uo.getRemotePath(), uo.getInputStream());
		} catch (Exception e) {
			throw e;
		}
		JSONObject json = JSONObject.parseObject(msg);
		Integer code = (Integer) json.get("code");
		if(code != 0) {
			throw new Exception("文件上传失败");
		}
		
		UserRole ur = new UserRole();
		ur.setUuid(StringUtil.getUUID());
		ur.setUserUuid(doctor.getUuid());
		ur.setRole(new Role("3"));
		userRoleMapper.insert(ur);
		
		return result;
	}

	public int insertSelective(Doctor doctor) {
		return doctorMapper.insertSelective(doctor);
	}

	public Doctor selectByPrimaryKey(String uuid) {
		return doctorMapper.selectByPrimaryKey(uuid);
	}

	public List<Doctor> selectDoctorsByDepartmentUUID(String departmentUUID) {
		return doctorMapper.selectDoctorsByDepartmentUUID(departmentUUID);
	}

	public int updateByPrimaryKeySelective(Doctor doctor) {
		return doctorMapper.updateByPrimaryKeySelective(doctor);
	}

	public int updateByPrimaryKey(Doctor doctor) {
		return doctorMapper.updateByPrimaryKey(doctor);
	}

	public Doctor selectByNumber(String number) {
		return doctorMapper.selectByNumber(number);
	}

	public PageInfo<Doctor> selectByConditionAndPaging(DoctorVO doctorVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<Doctor> list = new ArrayList<Doctor>();
		list = doctorMapper.selectByCondition(doctorVO);
		PageInfo<Doctor> pageInfo = new PageInfo<Doctor>(list);
		return pageInfo;
	}

	public Doctor selectByUserName(String userName) {
		return doctorMapper.selectByUserName(userName);
	}

}
