package top.chsis.service;

import java.util.List;

import top.chsis.model.DiseaseType;

public interface IDiseaseTypeService {

    int deleteByPrimaryKey(String uuid);

    int insert(DiseaseType record);

    int insertSelective(DiseaseType record);

    DiseaseType selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(DiseaseType record);

    int updateByPrimaryKey(DiseaseType record);
    
    List<DiseaseType> selectByLevel(Integer level);

	List<DiseaseType> selectByParentDiseaseType(String uuid);

	DiseaseType selectByName(String name);

}
