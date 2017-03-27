package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.util.Base64;
import com.github.pagehelper.PageInfo;

import top.chsis.model.Department;
import top.chsis.model.Doctor;
import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.model.UploadObject;
import top.chsis.service.IDoctorService;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;
import top.chsis.vo.DoctorVO;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private IManagerService managerService;
	
	@Autowired
	private IHospitalManagerService hospitalManagerService;
	
	@RequestMapping("/baseInfo")
	public String baseInfo(Model model) {
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Doctor doctor = doctorService.selectByUserName(userName.split("%")[0]);
		model.addAttribute("doctor", doctor);
		return "doctor/baseInfo";
	}
	
	@RequestMapping("/manage")
	public String manage(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//得到医生所属于的医院
		Hospital hospital = getManagedHospital(session);
		String hospitalUuid = hospital.getUuid();
		DoctorVO doctorVO = new DoctorVO(null, null, null, null, hospitalUuid);
		PageInfo<Doctor> pageInfo = doctorService.selectByConditionAndPaging(doctorVO, page, size);
		List<Doctor> doctors = pageInfo.getList();
		model.addAttribute("hospitalUuid", hospitalUuid);
		model.addAttribute("doctors", doctors);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "doctor/manage?");
		
		return "hospitalManager/manageDoctor";
	}
	
	@RequestMapping("/search")
	public String search(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String number,
									  @RequestParam(defaultValue = "") String name,
									  @RequestParam(defaultValue = "") String departmentName) {
		//得到所管理的医院
		Hospital hospital = getManagedHospital(session);
		String hospitalUuid = hospital.getUuid();
		DoctorVO doctorVO = new DoctorVO(null, number, name, departmentName, hospitalUuid);
		
		PageInfo<Doctor> pageInfo = doctorService.selectByConditionAndPaging(doctorVO, page, size);
		List<Doctor> doctors = pageInfo.getList();
		model.addAttribute("doctors", doctors);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "doctor/search?number=" + number + 
												"&name=" + name +
												"&departmentName=" + departmentName + "&" );
		
		return "hospitalManager/manageDoctor";
	}
	
	//添加医生
	@RequestMapping("/addDoctor")
	public String addDoctor(Doctor doctor, String departmentUuid, String url, HttpServletRequest request){
		doctor.setUuid(StringUtil.getUUID());
		doctor.setDepartment(new Department(departmentUuid));

		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(doctor.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		doctor.setPassword(encodedPassword);
		
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		String remoteBasePath = UploadObject.DOCTOR_ACCOUNT_PHOTO_BASE_PATH;
		UploadObject uo = new UploadObject(StringUtil.getUUID(), remoteBasePath, multipartFile);
		
		doctor.setPhoto(UploadObject.DOMAIN + uo.getRemotePath());
		try {
			doctorService.insert(doctor, uo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(url == null){
			return "redirect:/department/detail/" + departmentUuid;
		}else{
			return "redirect:/" + url;
		}	
	}
	
	//删除医生
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> deleteDoctor(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = doctorService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "该医生有创建就诊记录等信息，所以不能删除该医生哦~");
			}
		}
		return map;
	}
	
	//获取医生详情
	@RequestMapping("/get/{uuid}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Doctor doctor = doctorService.selectByPrimaryKey(uuid);
			if(doctor != null) {
				map.put("result", "success");
				map.put("doctor", doctor);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	//检查医生编号是否重复
	@RequestMapping("/checkNumberUnique/{number}")
	@ResponseBody
	public Map<String, Object> checkNumberUnique(@PathVariable String number) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(number)) {
			map.put("result", "exist");
		} else {
			Doctor doctor = doctorService.selectByNumber(number);
			if(doctor == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	//检查医生用户名是否重复
	@RequestMapping("/checkUserNameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUserNameUnique(@PathVariable String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(userName)) {
			map.put("result", "exist");
		} else {
			Doctor doctor = doctorService.selectByUserName(userName);
			if(doctor == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
		
	//根据登陆的管理员信息，查询所管理的医院。
	private Hospital getManagedHospital(HttpSession session) {
		HospitalManager hospitalManager = (HospitalManager) session.getAttribute("hospitalManager");
		if(hospitalManager == null) {
			//获取当前登录的用户
			String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			//根据当前用户查出管理员信息
			Manager manager = managerService.selectByUserName(userName.split("%")[0]);
			//根据管理员信息查出所管理的医院
			hospitalManager = hospitalManagerService.selectByManagerUuid(manager.getUuid());
		}
		return hospitalManager.getHospital();
	}
	
	@RequestMapping("/edit")
	public String edit(Doctor doctor) {
		doctorService.updateByPrimaryKeySelective(doctor);
		return "redirect:/doctor/baseInfo";
	}
}
