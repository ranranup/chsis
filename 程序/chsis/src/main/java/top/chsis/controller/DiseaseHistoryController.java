package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.model.DiseaseHistory;
import top.chsis.model.Resident;
import top.chsis.service.IDiseaseHistoryService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/diseaseHistory")
public class DiseaseHistoryController {
	
	@Autowired
	private IDiseaseHistoryService diseaseHistoryService;
	

	@RequestMapping("/getDiseaseHistoryByResidentUuid/{residentUuid}")
	@ResponseBody
	public Map<String, Object> getDiseaseHistoryByResidentUuid(@PathVariable String residentUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(residentUuid)) {
			map.put("result", "failure");
		} else {
			List<DiseaseHistory> diseaseHistories = diseaseHistoryService.selectDiseaseHistoriesByPatientUUID(residentUuid);
			if(diseaseHistories != null) {
				map.put("result", "success");
				map.put("diseaseHistories", diseaseHistories);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/diseaseHistoryDetail/{uuid}")
	@ResponseBody
	public Map<String, Object> diseaseHistoryDetail(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			DiseaseHistory diseaseHistory = diseaseHistoryService.selectByPrimaryKey(uuid);
			if(diseaseHistory != null) {
				map.put("result", "success");
				map.put("diseaseHistory", diseaseHistory);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	//添加疾病史
	@RequestMapping("/addDiseaseHistory")
	public String addDiseaseHistory(DiseaseHistory diseaseHistory, Model model, String patientUuid) {
		if(StringUtil.isNoE(diseaseHistory.getEndTime())) {
			diseaseHistory.setEndTime("--");
		}
		diseaseHistory.setUuid(StringUtil.getUUID());
		Resident resident = new Resident(patientUuid);
		diseaseHistory.setPatient(resident);
		diseaseHistoryService.insert(diseaseHistory);
		return "redirect:/resident/healthInfo";
	}
	
	//删除疾病史
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = diseaseHistoryService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
}
