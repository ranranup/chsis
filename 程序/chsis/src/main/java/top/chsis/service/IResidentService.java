package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Family;
import top.chsis.model.Resident;
import top.chsis.vo.ResidentVO;

public interface IResidentService {

	int deleteByPrimaryKey(String uuid);

	int insert(Resident record);

	int insertSelective(Resident record);

	Resident selectByPrimaryKey(String uuid);

	List<Resident> selectResidentsByFamilyUUID(String familyUUID);

	int updateByPrimaryKeySelective(Resident record);

	int updateByPrimaryKey(Resident record);

	PageInfo<ResidentVO> selectByConditionAndPaging(ResidentVO residentVO, int page, int size);

	Resident selectByUserName(String userName);

	List<Resident> selectAll();

	List<ResidentVO> selectByDimIdNo(String idNo);

	Resident selectByIdNo(String idNo);

	int insertResident(Resident resident);

	int insertResidentAndFamily(Resident resident, Family family);

	int removeMemberByPrimaryKey(String uuid);

}
