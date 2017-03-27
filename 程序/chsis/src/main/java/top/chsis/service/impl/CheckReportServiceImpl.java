package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.CheckReportMapper;
import top.chsis.model.CheckReport;
import top.chsis.model.UploadObject;
import top.chsis.service.ICheckReportService;
import top.chsis.util.UploadUtil;

@Service("checkReportService")
public class CheckReportServiceImpl implements ICheckReportService {
	
	@Autowired
	private CheckReportMapper checkReportMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return checkReportMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(CheckReport record, UploadObject uo) throws Exception {
		int result = checkReportMapper.insert(record);
		String msg = null;
		try {
			msg = UploadUtil.uploadImage(uo.getRemotePath(), uo.getInputStream());
		} catch (Exception e) {
			throw e;
		}
		JSONObject json = JSONObject.parseObject(msg);
		Integer code = (Integer) json.get("code");
		if(code != 0) {
			throw new Exception("文件上传失败");
		}
		return result;
	}

	public int insertSelective(CheckReport record){
		return checkReportMapper.insertSelective(record);
	}

	public CheckReport selectByPrimaryKey(String uuid) {
		return checkReportMapper.selectByPrimaryKey(uuid);
	}

	public List<CheckReport> selectCheckReportsByPatientUUID(String patientUUID) {
		return checkReportMapper.selectCheckReportsByPatientUUID(patientUUID);
	}

	public List<CheckReport> selectCheckReportsByHospitalUUID(String hospitalUUID) {
		return checkReportMapper.selectCheckReportsByHospitalUUID(hospitalUUID);
	}

	public List<CheckReport> selectCheckReportsByMedicalRecordUUID(String medicalrecordUUID) {
		return checkReportMapper.selectCheckReportsByMedicalRecordUUID(medicalrecordUUID);
	}

	public int updateByPrimaryKeySelective(CheckReport record, UploadObject uo) throws Exception {
		int result = checkReportMapper.updateByPrimaryKeySelective(record);
		String msg = null;
		try {
			msg = UploadUtil.uploadImage(uo.getRemotePath(), uo.getInputStream());
		} catch (Exception e) {
			throw e;
		}
		JSONObject json = JSONObject.parseObject(msg);
		Integer code = (Integer) json.get("code");
		if(code != 0) {
			throw new Exception("文件上传失败");
		}
		return result;
	}

	public int updateByPrimaryKey(CheckReport record) {
		return checkReportMapper.updateByPrimaryKey(record);
	}

	public int insert(CheckReport record) {
		return checkReportMapper.insert(record);
	}

	public PageInfo<CheckReport> selectByConditionAndPagingInResident(CheckReport checkReport, int page, int size) {
		PageHelper.startPage(page, size);
		List<CheckReport> list = new ArrayList<CheckReport>();
		list = checkReportMapper.selectByConditionInResident(checkReport);
		PageInfo<CheckReport> pageInfo = new PageInfo<CheckReport>(list);
		return pageInfo;
	}
}
