package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DiseaseMapper;
import top.chsis.model.Disease;
import top.chsis.service.IDiseaseService;

@Service("diseaseService")
public class DiseaseServiceImpl implements IDiseaseService {
	
	@Autowired
	private DiseaseMapper diseaseMapper;

	public int deleteByPrimaryKey(String uuid) {
		return diseaseMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Disease record) {
		return diseaseMapper.insert(record);
	}

	public int insertSelective(Disease record) {
		return 0;
	}

	public Disease selectByPrimaryKey(String uuid) {
		return diseaseMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Disease record) {
		return 0;
	}

	public int updateByPrimaryKey(Disease record) {
		return 0;
	}

	public List<Disease> selectByDiseaseType(String uuid) {
		return diseaseMapper.selectByDiseaseType(uuid);
	}

	public Disease selectByName(String name) {
		return diseaseMapper.selectByName(name);
	}

}
