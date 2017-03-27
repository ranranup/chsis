package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Family;
import top.chsis.vo.FamilyVO;

public interface IFamilyService {
	int deleteByPrimaryKey(String uuid);

    int insert(Family record);

    int insertSelective(Family record);

    Family selectByPrimaryKey(String uuid);
    
    List<Family> selectFamiliesByCommunityUUID(String communityUUID);

    int updateByPrimaryKeySelective(Family record);

    int updateByPrimaryKey(Family record);

	PageInfo<FamilyVO> selectByConditionAndPaging(FamilyVO familyVO, int page, int size);

	Family selectByNumber(String number);
}
