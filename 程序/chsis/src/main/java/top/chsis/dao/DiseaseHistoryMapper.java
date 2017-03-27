package top.chsis.dao;

import java.util.List;

import top.chsis.model.DiseaseHistory;

public interface DiseaseHistoryMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(DiseaseHistory record);

    int insertSelective(DiseaseHistory record);

    DiseaseHistory selectByPrimaryKey(String uuid);

    List<DiseaseHistory> selectDiseaseHistoriesByPatientUUID(String patientUUID);
    
    int updateByPrimaryKeySelective(DiseaseHistory record);

    int updateByPrimaryKey(DiseaseHistory record);
} 