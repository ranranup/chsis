package top.chsis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.DiseaseHistoryMapper;
import top.chsis.model.DiseaseHistory;
import top.chsis.service.IDiseaseHistoryService;

@Service("diseaseHistoryService")
public class DiseaseHistoryServiceImpl implements IDiseaseHistoryService {

	@Autowired
	private DiseaseHistoryMapper diseaseHistoryMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return diseaseHistoryMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(DiseaseHistory record) {
		return diseaseHistoryMapper.insert(record);
	}

	public int insertSelective(DiseaseHistory record) {
		return diseaseHistoryMapper.insertSelective(record);
	}

	public DiseaseHistory selectByPrimaryKey(String uuid) {
		return diseaseHistoryMapper.selectByPrimaryKey(uuid);
	}

	public List<DiseaseHistory> selectDiseaseHistoriesByPatientUUID(String patientUUID) {
		return diseaseHistoryMapper.selectDiseaseHistoriesByPatientUUID(patientUUID);
	}

	public int updateByPrimaryKeySelective(DiseaseHistory record) {
		return diseaseHistoryMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(DiseaseHistory record) {
		return diseaseHistoryMapper.updateByPrimaryKey(record);
	}

}
