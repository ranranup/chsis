package top.chsis.dao;

import java.util.List;

import top.chsis.model.DiseaseType;

public interface DiseaseTypeMapper {
	
    int deleteByPrimaryKey(String uuid);

    int insert(DiseaseType record);

    int insertSelective(DiseaseType record);

    DiseaseType selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(DiseaseType record);

    int updateByPrimaryKey(DiseaseType record);
    
    List<DiseaseType> selectByLevel(Integer level);
    
    DiseaseType selectByName(String name);
    
    List<DiseaseType> selectByParentDiseaseType(String uuid);
    
}