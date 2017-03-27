package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.CommunityMapper;
import top.chsis.model.Community;
import top.chsis.service.ICommunityService;

@Service("communityService")
public class CommunityServiceImpl implements ICommunityService {
	@Autowired
	private CommunityMapper  communityMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return communityMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Community record) {
		return communityMapper.insert(record);
	}

	public int insertSelective(Community record) {
		return communityMapper.insertSelective(record);
	}

	public Community selectByPrimaryKey(String uuid) {
		return communityMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Community record) {
		return communityMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Community record) {
		return communityMapper.updateByPrimaryKey(record);
	}

	public List<Community> selectAll() {
		return communityMapper.selectAll();
	}

}
