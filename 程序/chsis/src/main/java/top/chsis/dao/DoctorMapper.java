package top.chsis.dao;

import java.util.List;

import top.chsis.model.Doctor;
import top.chsis.vo.DoctorVO;

public interface DoctorMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(String uuid);
    
    List<Doctor> selectDoctorsByDepartmentUUID(String departmentUUID);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);
    
    Doctor selectByNumber(String number);
    
    Doctor selectByUserName(String userName);
    
    List<Doctor> selectByCondition(DoctorVO doctorVO);
}