package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DiseaseTypeMapper;
import top.chsis.model.DiseaseType;
import top.chsis.service.IDiseaseTypeService;

@Service("diseaseTypeService")
public class DiseaseTypeServiceImpl implements IDiseaseTypeService {

	@Autowired
	private DiseaseTypeMapper diseaseTypeMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return diseaseTypeMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(DiseaseType record) {
		return diseaseTypeMapper.insert(record);
	}

	public int insertSelective(DiseaseType record) {
		return 0;
	}

	public DiseaseType selectByPrimaryKey(String uuid) {
		return diseaseTypeMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(DiseaseType record) {
		return 0;
	}

	public int updateByPrimaryKey(DiseaseType record) {
		return 0;
	}

	public List<DiseaseType> selectByLevel(Integer level) {
		return diseaseTypeMapper.selectByLevel(level);
	}

	public List<DiseaseType> selectByParentDiseaseType(String uuid) {
		return diseaseTypeMapper.selectByParentDiseaseType(uuid);
	}

	public DiseaseType selectByName(String name) {
		return diseaseTypeMapper.selectByName(name);
	}

}
