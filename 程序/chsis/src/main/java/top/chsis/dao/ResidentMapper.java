package top.chsis.dao;

import java.util.List;

import top.chsis.model.Resident;
import top.chsis.vo.ResidentVO;

public interface ResidentMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(Resident record);

    int insertSelective(Resident record);

    Resident selectByPrimaryKey(String uuid);
    
    List<Resident> selectResidentsByFamilyUUID(String familyUUID);

    int updateByPrimaryKeySelective(Resident record);

    int updateByPrimaryKey(Resident record);
    
    List<ResidentVO> selectByCondition(ResidentVO residentVO);
    
    Resident selectByUserName(String userName);
    
    List<Resident> selectAll();

	List<ResidentVO> selectByDimIdNo(String idNo);
	
	Resident selectByIdNo(String idNo);

	int removeMemberByPrimaryKey(String uuid);
}