package top.chsis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.model.Doctor;
import top.chsis.model.ImmuneRecord;
import top.chsis.model.Resident;
import top.chsis.service.IDoctorService;
import top.chsis.service.IImmuneRecordService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/immuneRecord")
public class ImmuneRecordController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IImmuneRecordService immuneRecordService ;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@RequestMapping("/create/{patientUuid}")
	public String create(@PathVariable String patientUuid, Model model) {
		Resident patient = residentService.selectByPrimaryKey(patientUuid);
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		
		ImmuneRecord immuneRecord = new ImmuneRecord();
		immuneRecord.setUuid(StringUtil.getUUID());
		immuneRecord.setPatient(patient);
		immuneRecord.setHospital(doctor.getDepartment().getHospital());
		immuneRecord.setImmuneTime(sdf.format(new Date()));
		
		immuneRecordService.insert(immuneRecord);
		
		model.addAttribute("immuneRecord", immuneRecord);
		return "redirect:/immuneRecord/immuneRecordDetail/" + immuneRecord.getUuid();
	}
	
	@RequestMapping("/edit")
	public String edit(ImmuneRecord immuneRecord, Model model, HttpServletRequest request) {
		immuneRecordService.updateByPrimaryKeySelective(immuneRecord);
		model.addAttribute("immuneRecord", immuneRecord);
		return "redirect:/immuneRecord/finishedImmuneRecord/" + immuneRecord.getUuid();
	}
	
	@RequestMapping("/immuneRecordDetail/{uuid}")
	public String immuneRecordDetail(@PathVariable String uuid, Model model) {
		ImmuneRecord immuneRecord = immuneRecordService.selectByPrimaryKey(uuid);
		model.addAttribute("immuneRecord", immuneRecord);
		return "doctor/immuneRecordDetail";
	}
	
	@RequestMapping("/finishedImmuneRecord/{uuid}")
	public String finishedImmuneRecordDetail(@PathVariable String uuid, Model model) {
		ImmuneRecord immuneRecord = immuneRecordService.selectByPrimaryKey(uuid);
		model.addAttribute("immuneRecord", immuneRecord);
		return "doctor/finishedImmuneRecord";
	}
	
	@RequestMapping("/getImmuneRecord/{residentUuid}")
	@ResponseBody
	public Map<String, Object> getImmuneRecord(@PathVariable String residentUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(residentUuid)) {
			map.put("result", "failure");
		} else {
			List<ImmuneRecord> immuneRecords = immuneRecordService.selectImmuneRecordsByPatientUUID(residentUuid);
			if(immuneRecords != null) {
				map.put("result", "success");
				map.put("immuneRecords", immuneRecords);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
}
