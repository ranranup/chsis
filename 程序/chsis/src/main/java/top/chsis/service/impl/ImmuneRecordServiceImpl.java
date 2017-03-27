package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.ImmuneRecordMapper;
import top.chsis.model.ImmuneRecord;
import top.chsis.service.IImmuneRecordService;

@Service("immuneRecordService")
public class ImmuneRecordServiceImpl implements IImmuneRecordService {

	@Autowired
	private ImmuneRecordMapper immuneRecordMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return immuneRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(ImmuneRecord record) {
		return immuneRecordMapper.insert(record);
	}

	public int insertSelective(ImmuneRecord record) {
		return immuneRecordMapper.insertSelective(record);
	}

	public ImmuneRecord selectByPrimaryKey(String uuid) {
		return immuneRecordMapper.selectByPrimaryKey(uuid);
	}

	public List<ImmuneRecord> selectImmuneRecordsByPatientUUID(String patientUUID) {
		return immuneRecordMapper.selectImmuneRecordsByPatientUUID(patientUUID);
	}

	public List<ImmuneRecord> selectImmuneRecordsByHospitalUUID(String hospitalUUID) {
		return immuneRecordMapper.selectImmuneRecordsByHospitalUUID(hospitalUUID);
	}

	public int updateByPrimaryKeySelective(ImmuneRecord record) {
		return immuneRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ImmuneRecord record) {
		return immuneRecordMapper.updateByPrimaryKey(record);
	}

	public PageInfo<ImmuneRecord> selectByConditionAndPagingInResident(ImmuneRecord immuneRecord, int page, int size) {
		PageHelper.startPage(page, size);
		List<ImmuneRecord> list = new ArrayList<ImmuneRecord>();
		list = immuneRecordMapper.selectByConditionInResident(immuneRecord);
		PageInfo<ImmuneRecord> pageInfo = new PageInfo<ImmuneRecord>(list);
		return pageInfo;
	}

}
