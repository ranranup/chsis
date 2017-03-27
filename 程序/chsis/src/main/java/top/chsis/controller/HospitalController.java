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

import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IHospitalService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	
	@Autowired
	private IHospitalService hospitalService;
	
	@Autowired
	private IHospitalManagerService hospitalManagerService;
	
	@RequestMapping("/list")
	public String manageHospital(Model model) {
		List<Hospital> hospitals = hospitalService.selectAll();
		List<HospitalManager> hospitalManagers = hospitalManagerService.selectAll();
		
		model.addAttribute("hospitals", hospitals);
		model.addAttribute("hospitalManagers", hospitalManagers);
		return "admin/manageHospital";
	}
	
	@RequestMapping("/addHospital")
	public String addHospital(Hospital hospital, Model model) {
		hospital.setUuid(StringUtil.getUUID());
		hospitalService.insert(hospital);
		return "redirect:/hospital/list/";
	}
	
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> deleteHospital(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = hospitalService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "该医院下还有科室，不能删除该医院哦~");
			}
		}
		return map;
	}
	
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable String uuid, Model model){
		Hospital hospital = hospitalService.selectByPrimaryKey(uuid);
		List<HospitalManager> hospitalManagers = hospitalManagerService.selectByHospitalUuid(uuid); 
		model.addAttribute("hospital", hospital); 
		model.addAttribute("hospitalManagers", hospitalManagers); 
		return "admin/hospitalDetail";
	}
	
	@RequestMapping("/checkNumberUnique/{number}")
	@ResponseBody
	public Map<String, Object> checkNumberUnique(@PathVariable String number) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(number)) {
			map.put("result", "exist");
		} else {
			Hospital hospital = hospitalService.selectByNumber(number);
			if(hospital == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
}
