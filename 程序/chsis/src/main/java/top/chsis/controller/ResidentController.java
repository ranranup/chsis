package top.chsis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.CheckReport;
import top.chsis.model.Disease;
import top.chsis.model.DiseaseHistory;
import top.chsis.model.ImmuneRecord;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Resident;
import top.chsis.service.ICheckReportService;
import top.chsis.service.IDiseaseHistoryService;
import top.chsis.service.IImmuneRecordService;
import top.chsis.service.IMedicalRecordService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;
import top.chsis.vo.ResidentVO;

@Controller
@RequestMapping("/resident")
public class ResidentController {
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IDiseaseHistoryService diseaseHistoryService;
	
	@Autowired
	private IMedicalRecordService medicalRecordService;
	
	@Autowired
	private ICheckReportService checkReportService;
	
	@Autowired
	private IImmuneRecordService immuneRecordService;
	

	@RequestMapping("/baseInfo")
	public String baseInfo(Model model) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		model.addAttribute("resident", resident);
		return "resident/baseInfo";
	}
	
	@RequestMapping("/healthInfo")
	public String healthInfo(Model model) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		
		//获得居民的疾病史信息
		List<DiseaseHistory> diseaseHistories = diseaseHistoryService.selectDiseaseHistoriesByPatientUUID(resident.getUuid());
		
		model.addAttribute("resident", resident);
		model.addAttribute("diseaseHistories", diseaseHistories);
		return "resident/healthInfo";
	}
	
	@RequestMapping("/manage")
	public String manage(ResidentVO residentVO, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<ResidentVO> pageInfo = residentService.selectByConditionAndPaging(null, page, size);
		List<ResidentVO> residents = pageInfo.getList();
		model.addAttribute("residents", residents);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/manage?");
		
		return "admin/manageResident";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String userName,
									  @RequestParam(defaultValue = "") String name,
									  @RequestParam(defaultValue = "") String sex,
									  @RequestParam(defaultValue = "") String idNo,
									  @RequestParam(defaultValue = "") String familyNumber) {
		ResidentVO residentVO = new ResidentVO(null,userName,name,sex, idNo, null, familyNumber);
		
		PageInfo<ResidentVO> pageInfo = residentService.selectByConditionAndPaging(residentVO, page, size);
		List<ResidentVO> residents = pageInfo.getList();
		model.addAttribute("residents", residents);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/search?userName=" + userName + 
									"&name=" + name + 
									"&sex=" + sex +
									"&idNo=" + idNo + 
									"&familyNumber=" + familyNumber + "&" );
		
		return "admin/manageResident";
	}
	
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = residentService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/remove/{uuid}")
	@ResponseBody
	public Map<String, Object> remove(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = residentService.removeMemberByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/get/{uuid}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Resident resident = residentService.selectByPrimaryKey(uuid);
			
			if(resident != null) {
				map.put("result", "success");
				map.put("resident", resident);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/getByDimIdNo")
	@ResponseBody
	public List<ResidentVO> getByDimIdNo(String query) {
		List<ResidentVO> list = new ArrayList<ResidentVO>();
		if(StringUtil.isNoE(query)) {
			return list;
		}
		list = residentService.selectByDimIdNo(query);
		for(ResidentVO r : list) {
			r.setName(r.getName() + " | " + r.getIdNo());
		}
		return list;
	}
	
	@RequestMapping("/edit")
	public String editResident(Resident resident, String url, String leftEyesight, String rightEyesight) {
		//接收前台的leftEyesight，rightEyesight，拼接成完整字符串eyesight，传给后台
		String eyesight = leftEyesight + "," + rightEyesight;
		//根据不同的参数，返回不同的页面
		if(leftEyesight != null && rightEyesight != null) {
			//为eyesight赋值
			resident.setEyesight(eyesight);
			residentService.updateByPrimaryKeySelective(resident);
			return "redirect:/resident/healthInfo";
		}else if(url != null) {
			residentService.updateByPrimaryKeySelective(resident);
			return "redirect:/" + url;
		}else {
			residentService.updateByPrimaryKeySelective(resident);
			return "redirect:/resident/baseInfo";
		}	
	}
	
	@RequestMapping("/complete")
	public String completeResident(Resident resident,String leftEyesight, String rightEyesight, Model model) {
		//接收前台的leftEyesight，rightEyesight，拼接成完整字符串eyesight，传给后台
		String eyesight = leftEyesight + "," + rightEyesight;
		//为eyesight赋值
		resident.setEyesight(eyesight);
		residentService.updateByPrimaryKeySelective(resident);
		resident = residentService.selectByPrimaryKey(resident.getUuid());
		model.addAttribute("resident", resident);
		return "resident/baseInfo";
	}
	
	
	@RequestMapping("/getResidentAndDiseaseHistory/{uuid}")
	@ResponseBody
	public Map<String, Object> getResidentAndDiseaseHistory(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Resident resident = residentService.selectByPrimaryKey(uuid);
		resident.setPassword(null);
		resident.setNation(null);
		resident.setBirth(null);
		resident.setPeriod(null);
		resident.setPhone(null);
		resident.setMarriage(null);
		resident.setFamily(null);
		
		map.put("result", "success");
		map.put("resident", resident);
		
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			List<DiseaseHistory> diseaseHistories = diseaseHistoryService.selectDiseaseHistoriesByPatientUUID(uuid);
			map.put("diseaseHistories", diseaseHistories);
		}
		return map;
	}
	
	@RequestMapping("/medicalRecord")
	public String medicalRecord(MedicalRecord medicalRecord, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		medicalRecord.setPatient(resident);
		PageInfo<MedicalRecord> pageInfo = medicalRecordService.selectByConditionAndPagingInResident(medicalRecord, page, size);
		List<MedicalRecord> medicalRecords = pageInfo.getList();
		model.addAttribute("medicalRecords", medicalRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/medicalRecord?");
		
		return "resident/medicalRecord";
	}
	
	@RequestMapping("/searchMedicalRecord")
	public String searchMedicalRecord(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String diseaseName,
									  @RequestParam(defaultValue = "") String time,
									  @RequestParam(defaultValue = "") String state) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		Integer realState = null;
		if(state != null && !state.equals("")){
			realState = Integer.parseInt(state);
		}
		
		//构建Disease对象
		Disease disease = new Disease();
		disease.setName(diseaseName);
		
		//构建MedicalRecordVO对象
		//MedicalRecord medicalRecord = new MedicalRecord(null, time, disease, state, resident);
		MedicalRecord medicalRecord = new MedicalRecord(null, resident, time, null, disease, null, realState);
		
		PageInfo<MedicalRecord> pageInfo = medicalRecordService.selectByConditionAndPagingInResident(medicalRecord, page, size);
		List<MedicalRecord> medicalRecords = pageInfo.getList();
		model.addAttribute("medicalRecords", medicalRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/searchMedicalRecord?disease=" + disease + 
									"&time=" + time +
									"&state=" + state + "&" );
		return "resident/medicalRecord";
	}
	
	@RequestMapping("/medicalRecordDetail/{uuid}")
	public String medicalRecordDetail(@PathVariable String uuid, Model model) {
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(uuid);
		List<CheckReport> checkReports = checkReportService.selectCheckReportsByMedicalRecordUUID(uuid);
		model.addAttribute("medicalRecord", medicalRecord);
		model.addAttribute("checkReports", checkReports);
		return "resident/medicalRecordDetail";
	}
	
	@RequestMapping("/immuneRecord")
	public String immuneRecord(ImmuneRecord immuneRecord, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		immuneRecord.setPatient(resident);
		PageInfo<ImmuneRecord> pageInfo = immuneRecordService.selectByConditionAndPagingInResident(immuneRecord, page, size);
		List<ImmuneRecord> immuneRecords = pageInfo.getList();
		model.addAttribute("immuneRecords", immuneRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/medicalRecord?");
		
		return "resident/immuneRecord";
	}
	
	@RequestMapping("/searchImmuneRecord")
	public String searchImmuneRecord(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String vaccine,
									  @RequestParam(defaultValue = "") String immuneTime) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		ImmuneRecord immuneRecord = new ImmuneRecord(null, resident, immuneTime, null, vaccine);
		
		PageInfo<ImmuneRecord> pageInfo = immuneRecordService.selectByConditionAndPagingInResident(immuneRecord, page, size);
		List<ImmuneRecord> immuneRecords = pageInfo.getList();
		model.addAttribute("immuneRecords", immuneRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/searchImmuneRecord?vaccine=" + vaccine + 
									"&immuneTime=" + immuneTime+ "&" );
		return "resident/immuneRecord";
	}
	
	@RequestMapping("/healthRecord")
	public String healthRecord(CheckReport checkReport, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		checkReport.setPatient(resident);
		PageInfo<CheckReport> pageInfo = checkReportService.selectByConditionAndPagingInResident(checkReport, page, size);
		List<CheckReport> checkReports = pageInfo.getList();
		model.addAttribute("checkReports", checkReports);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/healthRecord?");
		
		return "resident/healthRecord";
	}
	
	@RequestMapping("/searchHealthRecord")
	public String searchHealthRecord(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size,
			@RequestParam(defaultValue = "") String time) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		CheckReport checkReport = new CheckReport(null, null, null, time, resident, null, null, 1, null);
		
		PageInfo<CheckReport> pageInfo = checkReportService.selectByConditionAndPagingInResident(checkReport, page, size);
		List<CheckReport> checkReports = pageInfo.getList();
		model.addAttribute("checkReports", checkReports);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resident/searchHealthRecord?time=" + time + "&" );
		return "resident/healthRecord";
	}
	
}
