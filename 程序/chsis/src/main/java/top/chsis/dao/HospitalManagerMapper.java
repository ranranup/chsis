package top.chsis.dao;

import java.util.List;

import top.chsis.model.HospitalManager;

public interface HospitalManagerMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(HospitalManager record);

    int insertSelective(HospitalManager record);

    HospitalManager selectByPrimaryKey(String uuid);
    
    List<HospitalManager> selectByHospitalUuid(String hospitalUuid);

    int updateByPrimaryKeySelective(HospitalManager record);

    int updateByPrimaryKey(HospitalManager record);
    
    List<HospitalManager> selectAll();
    
    HospitalManager selectByManagerUuid(String managerUuid);
}