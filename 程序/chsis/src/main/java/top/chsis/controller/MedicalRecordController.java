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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageInfo;

import top.chsis.model.CheckReport;
import top.chsis.model.Doctor;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Resident;
import top.chsis.model.UploadObject;
import top.chsis.service.ICheckReportService;
import top.chsis.service.IDoctorService;
import top.chsis.service.IMedicalRecordService;
import top.chsis.service.IResidentService;
import top.chsis.util.StringUtil;
import top.chsis.vo.MedicalRecordVO;

@Controller
@RequestMapping("/medicalRecord")
public class MedicalRecordController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IMedicalRecordService medicalRecordService;
	
	@Autowired
	private ICheckReportService checkReportService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/toCreate")
	public String toCreate() {
		return "doctor/createRecord";
	}
	
	@RequestMapping("/create/{patientUuid}")
	public String create(@PathVariable String patientUuid, Model model) {
		Resident patient = residentService.selectByPrimaryKey(patientUuid);
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		
		MedicalRecord medicalRecord = new MedicalRecord();
		medicalRecord.setUuid(StringUtil.getUUID());
		medicalRecord.setPatient(patient);
		medicalRecord.setDoctor(doctor);
		medicalRecord.setTime(sdf.format(new Date()));
		medicalRecord.setState(MedicalRecord.IN_VISITING);
		medicalRecordService.insert(medicalRecord);
		
		model.addAttribute("medicalRecord", medicalRecord);
		return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecord.getUuid();
	}
	
	@RequestMapping("/edit")
	public String edit(MedicalRecord medicalRecord, Model model) {
		medicalRecordService.updateByPrimaryKeySelective(medicalRecord);
		medicalRecord = medicalRecordService.selectByPrimaryKey(medicalRecord.getUuid());
		model.addAttribute("medicalRecord", medicalRecord);
		if(medicalRecord.getState() == MedicalRecord.VISITED) {
			return "redirect:/medicalRecord/finishedMedicalRecordDetail/" + medicalRecord.getUuid();
		} else {
			return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecord.getUuid();
		}
	}
	
	@RequestMapping("/editDiseaseName")
	@ResponseBody
	public Map<String, String> editDiseaseName(MedicalRecord medicalRecord, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		int result = medicalRecordService.updateByPrimaryKeySelective(medicalRecord);
		medicalRecord = medicalRecordService.selectByPrimaryKey(medicalRecord.getUuid());
		if(result == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/unfinishedMedicalRecordDetail/{uuid}")
	public String unfinishedMedicalRecordDetail(@PathVariable String uuid, Model model) {
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(uuid);
		List<CheckReport> checkReports = checkReportService.selectCheckReportsByMedicalRecordUUID(uuid);
		model.addAttribute("medicalRecord", medicalRecord);
		model.addAttribute("checkReports", checkReports);
		return "doctor/unfinishedMedicalRecordDetail";
	}
	
	@RequestMapping("/finishedMedicalRecordDetail/{uuid}")
	public String finishedMedicalRecordDetail(@PathVariable String uuid, Model model) {
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(uuid);
		List<CheckReport> checkReports = checkReportService.selectCheckReportsByMedicalRecordUUID(uuid);
		model.addAttribute("medicalRecord", medicalRecord);
		model.addAttribute("checkReports", checkReports);
		return "doctor/finishedMedicalRecordDetail";
	}
	
	@RequestMapping("/addCheckReport")
	public String addCheckReport(String medicalRecordUuid, CheckReport checkReport, Model model, HttpServletRequest request){
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(medicalRecordUuid);
		
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setTime(sdf.format(new Date()));
		checkReport.setMedicalRecord(medicalRecord);
		checkReport.setPatient(medicalRecord.getPatient());
		checkReport.setHospital(medicalRecord.getDoctor().getDepartment().getHospital());
		checkReport.setState(CheckReport.IN_VISITING);
		
		//处理图片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		String remoteBasePath = UploadObject.REPORT_BASE_PATH;
		UploadObject uo = new UploadObject(StringUtil.getUUID(), remoteBasePath, multipartFile);
		
		checkReport.setUrl(UploadObject.DOMAIN + uo.getRemotePath());
		try {
			//改造service层的insert方法
			checkReportService.insert(checkReport, uo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("checkReport", checkReport);
		return "redirect:/medicalRecord/unfinishedMedicalRecordDetail/" + medicalRecordUuid;
	}
	
	
	@RequestMapping("/unfinished")
	public String unfinished(MedicalRecordVO medicalRecordVO, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		medicalRecordVO.setDoctorUuid(doctor.getUuid());
		medicalRecordVO.setState("0");//state:0待完成就诊记录，1已完成就诊记录
		PageInfo<MedicalRecordVO> pageInfo = medicalRecordService.selectByConditionAndPaging(medicalRecordVO, page, size);
		List<MedicalRecordVO> medicalRecords = pageInfo.getList();
		model.addAttribute("medicalRecords", medicalRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "medicalRecord/unfinished?");
		
		return "doctor/unfinishedMedicalRecord";
	}
	
	@RequestMapping("/finished")
	public String finished(MedicalRecordVO medicalRecordVO, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		medicalRecordVO.setDoctorUuid(doctor.getUuid());
		medicalRecordVO.setState("1");//state:0待完成就诊记录，1已完成就诊记录
		PageInfo<MedicalRecordVO> pageInfo = medicalRecordService.selectByConditionAndPaging(medicalRecordVO, page, size);
		List<MedicalRecordVO> medicalRecords = pageInfo.getList();
		model.addAttribute("medicalRecords", medicalRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "medicalRecord/finished?");
		
		return "doctor/finishedMedicalRecord";
	}
	
	@RequestMapping("/search")
	public String search(Model model, String state, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String name,
									  @RequestParam(defaultValue = "") String idNo,
									  @RequestParam(defaultValue = "") String time,
									  @RequestParam(defaultValue = "") String sex) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		MedicalRecordVO medicalRecordVO = new MedicalRecordVO(null, name, sex, idNo, time, null, doctor.getUuid(), state, null);
		
		PageInfo<MedicalRecordVO> pageInfo = medicalRecordService.selectByConditionAndPaging(medicalRecordVO, page, size);
		List<MedicalRecordVO> medicalRecords = pageInfo.getList();
		model.addAttribute("medicalRecords", medicalRecords);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "medicalRecord/search?name=" + name + 
									"&idNo=" + idNo + 
									"&time=" + time +
									"&sex=" + sex + "&" );
		if(state.equals("0")) {
			return "doctor/unfinishedMedicalRecord";
		}else {
			return "doctor/finishedMedicalRecord";
		}
	}
	
	@RequestMapping("/editState/{uuid}")
	@ResponseBody
	public Map<String, String> editState(Model model, @PathVariable String uuid) {
		Map<String, String> map = new HashMap<String, String>();
		MedicalRecord medicalRecord = medicalRecordService.selectByPrimaryKey(uuid);
		medicalRecord.setState(MedicalRecord.VISITED);
		int i = medicalRecordService.updateByPrimaryKeySelective(medicalRecord);
		if(i == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
}
