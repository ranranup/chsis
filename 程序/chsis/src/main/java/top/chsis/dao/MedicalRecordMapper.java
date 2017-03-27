package top.chsis.dao;

import java.util.List;
import java.util.Map;

import top.chsis.model.MedicalRecord;
import top.chsis.vo.MedicalRecordVO;
import top.chsis.vo.PiePair;

public interface MedicalRecordMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(MedicalRecord record);

    int insertSelective(MedicalRecord record);

    MedicalRecord selectByPrimaryKey(String uuid);
    
    List<MedicalRecord> selectMedicalRecordsByPatientUUID(String patientUUID);

    List<MedicalRecord> selectMedicalRecordsByDoctorUUID(String doctorUUID);
    
    int updateByPrimaryKeySelective(MedicalRecord record);

    int updateByPrimaryKey(MedicalRecord record);

	List<MedicalRecordVO> selectByCondition(MedicalRecordVO medicalRecordVO);
	
	List<MedicalRecord> selectByConditionInResident(MedicalRecord medicalRecord);
	
	List<MedicalRecord> selectByDiseaseUuidAndYear(String diseaseUuid, String year);

	List<MedicalRecord> selectByMultipleDiseaseUuidAndYear(Map<String, Object> map);

	List<PiePair> selectMostFiveByPeriod(String period);

	int selectCountByPeriod(String period);
}