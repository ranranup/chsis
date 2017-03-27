package top.chsis.dao;

import java.util.List;

import top.chsis.model.Hospital;

public interface HospitalMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Hospital record);

    int insertSelective(Hospital record);

    Hospital selectByPrimaryKey(String uuid);
    
    Hospital selectByNumber(String number);

    int updateByPrimaryKeySelective(Hospital record);

    int updateByPrimaryKey(Hospital record);
    
    List<Hospital> selectAll();
}