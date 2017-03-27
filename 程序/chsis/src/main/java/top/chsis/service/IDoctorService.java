package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Doctor;
import top.chsis.model.UploadObject;
import top.chsis.vo.DoctorVO;

public interface IDoctorService {
	int deleteByPrimaryKey(String uuid);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(String uuid);
    
    List<Doctor> selectDoctorsByDepartmentUUID(String departmentUUID);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

	int insert(Doctor doctor, UploadObject uo) throws Exception;

	Doctor selectByNumber(String number);
	
	Doctor selectByUserName(String userName);

	PageInfo<Doctor> selectByConditionAndPaging(DoctorVO doctorVO, int page, int size);
}
