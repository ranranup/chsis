package top.chsis.dao;

import java.util.List;

import top.chsis.model.Disease;

public interface DiseaseMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Disease record);

    int insertSelective(Disease record);

    Disease selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(Disease record);

    int updateByPrimaryKey(Disease record);
    
    List<Disease> selectByDiseaseType(String uuid);
    
    Disease selectByName(String name);
}