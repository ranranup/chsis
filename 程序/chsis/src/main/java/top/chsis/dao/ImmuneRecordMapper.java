package top.chsis.dao;

import java.util.List;

import top.chsis.model.ImmuneRecord;

public interface ImmuneRecordMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(ImmuneRecord record);

    int insertSelective(ImmuneRecord record);

    ImmuneRecord selectByPrimaryKey(String uuid);
    
    List<ImmuneRecord> selectImmuneRecordsByPatientUUID(String patientUUID);
    
    List<ImmuneRecord> selectImmuneRecordsByHospitalUUID(String hospitalUUID);

    int updateByPrimaryKeySelective(ImmuneRecord record);

    int updateByPrimaryKey(ImmuneRecord record);

	List<ImmuneRecord> selectByConditionInResident(ImmuneRecord immuneRecord);
}