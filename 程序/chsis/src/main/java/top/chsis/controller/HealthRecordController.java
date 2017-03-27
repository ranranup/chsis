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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import top.chsis.model.CheckReport;
import top.chsis.model.Doctor;
import top.chsis.model.Resident;
import top.chsis.model.UploadObject;
import top.chsis.service.ICheckReportService;
import top.chsis.service.IDoctorService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/healthRecord")
public class HealthRecordController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private ICheckReportService checkReportService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	//新建体检记录
	@RequestMapping("/create/{patientUuid}")
	public String create(@PathVariable String patientUuid, Model model) {
		Resident patient = residentService.selectByPrimaryKey(patientUuid);
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		
		CheckReport checkReport = new CheckReport();
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setName("体检");
		checkReport.setPatient(patient);
		checkReport.setHospital(doctor.getDepartment().getHospital());
		checkReport.setTime(sdf.format(new Date()));
		checkReport.setState(CheckReport.IN_VISITING);
		checkReportService.insert(checkReport);
		
		model.addAttribute("checkReport", checkReport);
		return "redirect:/healthRecord/healthRecordDetail/" + checkReport.getUuid();
	}
	
	@RequestMapping("/edit")
	public String edit(CheckReport checkReport, Model model, HttpServletRequest request) {
		//处理图片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		String remoteBasePath = UploadObject.REPORT_BASE_PATH;
		UploadObject uo = new UploadObject(StringUtil.getUUID(), remoteBasePath, multipartFile);
		
		checkReport.setUrl(UploadObject.DOMAIN + uo.getRemotePath());
		checkReport.setState(CheckReport.VISITED);
		try {
			//改造service层的insert方法
			checkReportService.updateByPrimaryKeySelective(checkReport, uo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("checkReport", checkReport);
		return "redirect:/healthRecord/healthRecordDetail/" + checkReport.getUuid();
	}
	
	@RequestMapping("/healthRecordDetail/{uuid}")
	public String healthRecordDetail(@PathVariable String uuid, Model model) {
		CheckReport checkReport = checkReportService.selectByPrimaryKey(uuid);
		model.addAttribute("checkReport", checkReport);
		return "doctor/healthRecordDetail";
	}
	
	@RequestMapping("/getHealthRecord/{residentUuid}")
	@ResponseBody
	public Map<String, Object> getHealthRecord(@PathVariable String residentUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(residentUuid)) {
			map.put("result", "failure");
		} else {
			List<CheckReport> checkReports = checkReportService.selectCheckReportsByPatientUUID(residentUuid);
			if(checkReports != null) {
				map.put("result", "success");
				map.put("checkReports", checkReports);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
}
