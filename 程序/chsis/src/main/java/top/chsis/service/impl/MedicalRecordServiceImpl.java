package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.MedicalRecordMapper;
import top.chsis.model.MedicalRecord;
import top.chsis.service.IMedicalRecordService;
import top.chsis.vo.MedicalRecordVO;
import top.chsis.vo.PieObject;
import top.chsis.vo.PiePair;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("medicalRecordService")
public class MedicalRecordServiceImpl implements IMedicalRecordService {

	@Autowired
	private MedicalRecordMapper medicalRecordMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return medicalRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(MedicalRecord record) {
		return medicalRecordMapper.insert(record);
	}

	public int insertSelective(MedicalRecord record) {
		return medicalRecordMapper.insertSelective(record);
	}

	public MedicalRecord selectByPrimaryKey(String uuid) {
		return medicalRecordMapper.selectByPrimaryKey(uuid);
	}

	public List<MedicalRecord> selectMedicalRecordsByPatientUUID(String patientUUID) {
		return medicalRecordMapper.selectMedicalRecordsByPatientUUID(patientUUID);
	}

	public List<MedicalRecord> selectMedicalRecordsByDoctorUUID(String doctorUUID) {
		return medicalRecordMapper.selectMedicalRecordsByDoctorUUID(doctorUUID);
	}

	public int updateByPrimaryKeySelective(MedicalRecord record) {
		return medicalRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(MedicalRecord record) {
		return medicalRecordMapper.updateByPrimaryKey(record);
	}

	public PageInfo<MedicalRecordVO> selectByConditionAndPaging(MedicalRecordVO medicalRecordVO, int page, int size) {
		PageHelper.startPage(page, size);
		List<MedicalRecordVO> list = new ArrayList<MedicalRecordVO>();
		list = medicalRecordMapper.selectByCondition(medicalRecordVO);
		PageInfo<MedicalRecordVO> pageInfo = new PageInfo<MedicalRecordVO>(list);
		return pageInfo;
	}

	public PageInfo<MedicalRecord> selectByConditionAndPagingInResident(MedicalRecord medicalRecord, int page, int size) {
		PageHelper.startPage(page, size);
		List<MedicalRecord> list = new ArrayList<MedicalRecord>();
		list = medicalRecordMapper.selectByConditionInResident(medicalRecord);
		PageInfo<MedicalRecord> pageInfo = new PageInfo<MedicalRecord>(list);
		return pageInfo;
	}

	public Integer[] singleDiseaseStatistics(String diseaseUuid, String year) {
		List<MedicalRecord> list = medicalRecordMapper.selectByDiseaseUuidAndYear(diseaseUuid, year);
		Integer[] data = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		for(MedicalRecord record : list) {
			String month = record.getTime();
			data = handleMonth(month, data);
		}
		return data;
	}

	public List<Integer[]> multipleDiseaseStatistics(List<String> diseaseUuids, String year) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer[]> list = new ArrayList<Integer[]>();
		Integer[] arr1 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		Integer[] arr2 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		Integer[] arr3 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		map.put("diseaseUuids", diseaseUuids);
		map.put("year", year);
		List<MedicalRecord> medicalRecords = medicalRecordMapper.selectByMultipleDiseaseUuidAndYear(map);
		for(MedicalRecord md : medicalRecords) {
			if(md.getDisease().getUuid().equals(diseaseUuids.get(0))) {
				arr1 = handleMonth(md.getTime(), arr1);
			} else if(diseaseUuids.size() > 1 && md.getDisease().getUuid().equals(diseaseUuids.get(1))) {
				arr2 = handleMonth(md.getTime(), arr2);
			} else if(diseaseUuids.size() > 2){
				arr3 = handleMonth(md.getTime(), arr3);
			}
		}
		list.add(arr1);
		list.add(arr2);
		list.add(arr3);
		return list;
	}
	
	public PieObject diseasePercentStatistics(String period) {
		PieObject pieObject = null;
		//查出时间段内的前5中疾病数量
		List<PiePair> mostFive = medicalRecordMapper.selectMostFiveByPeriod(period);
		//查出这段时间内的所有疾病总数
		int count = medicalRecordMapper.selectCountByPeriod(period);
		int five = 0;
		for(PiePair p : mostFive) {
			five += p.getValue();
		}
		if(count != five) {
			//构建一个新的pair
			PiePair pair = new PiePair("其它", count - five);
			mostFive.add(pair);
		}
		String[] diseaseNames = new String[mostFive.size()];
		for(int i=0; i < mostFive.size(); i++) {
			diseaseNames[i] = mostFive.get(i).getName();
		}
		pieObject = new PieObject(diseaseNames, mostFive);
		return pieObject;
	}
	
	private static Integer[] handleMonth(String month, Integer[] arr) {
		if(month.equals("01")) {
			arr[0] = arr[0] + 1;
		}
		if(month.equals("02")) {
			arr[1] = arr[1] + 1;
		}
		if(month.equals("03")) {
			arr[2] = arr[2] + 1;
		}
		if(month.equals("04")) {
			arr[3] = arr[3] + 1;
		}
		if(month.equals("05")) {
			arr[4] = arr[4] + 1;
		}
		if(month.equals("06")) {
			arr[5] = arr[5] + 1;
		}
		if(month.equals("07")) {
			arr[6] = arr[6] + 1;
		}
		if(month.equals("08")) {
			arr[7] = arr[7] + 1;
		}
		if(month.equals("09")) {
			arr[8] = arr[8] + 1;
		}
		if(month.equals("10")) {
			arr[9] = arr[9] + 1;
		}
		if(month.equals("11")) {
			arr[10] = arr[10] + 1;
		}
		if(month.equals("12")) {
			arr[11] = arr[11] + 1;
		}
		return arr;
	}

}
