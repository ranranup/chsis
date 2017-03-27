package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Department;
import top.chsis.model.Doctor;
import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IDepartmentService;
import top.chsis.service.IDoctorService;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IManagerService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/department")
public class DepartmentContrller {
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private IManagerService managerService;
	
	@Autowired
	private IHospitalManagerService hospitalManagerService;
	
	@Autowired
	private IDoctorService doctorService;
	
	@RequestMapping("/manage")
	public String manage(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		//得到所管理的医院
		Hospital hospital = getManagedHospital(session);
		//构造查询参数
		Department department = new Department();
		department.setHospital(hospital);
		
		//查询
		PageInfo<Department> pageInfo = departmentService.selectByConditionAndPaging(department, page, size);
		List<Department> departments = pageInfo.getList();
		model.addAttribute("departments", departments);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "department/manage?");
		
		return "hospitalManager/manageDepartment";
	}
	
	@RequestMapping("/search")
	public String search(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String number,
									  @RequestParam(defaultValue = "") String name) {
		//得到所管理的医院
		Hospital hospital = getManagedHospital(session);
		Department department = new Department(null, number, name,hospital);
		
		PageInfo<Department> pageInfo = departmentService.selectByConditionAndPaging(department, page, size);
		List<Department> departments = pageInfo.getList();
		model.addAttribute("departments", departments);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "department/search?number=" + number + 
									"&name=" + name + "&" );
		
		return "hospitalManager/manageDepartment";
	}
	
	//添加科室
	@RequestMapping("/addDepartment")
	public String addHospital(Department department, Model model, HttpSession session) {
		department.setUuid(StringUtil.getUUID());
		department.setHospital(getManagedHospital(session));
		departmentService.insert(department);
		return "redirect:/department/manage";
	}
	
	//检查科室编号是否重复
	@RequestMapping("/checkNumberUnique/{number}")
	@ResponseBody
	public Map<String, Object> checkNumberUnique(@PathVariable String number) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(number)) {
			map.put("result", "exist");
		} else {
			Department department = departmentService.selectByNumber(number);
			if(department == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	//删除科室
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = departmentService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "该科室下还有医生，不能删除该科室哦~");
			}
		}
		return map;
	}
	
	
	//获取科室详情
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable String uuid,Model model){
		Department department = departmentService.selectByPrimaryKey(uuid);
		List<Doctor> doctors = doctorService.selectDoctorsByDepartmentUUID(uuid);
		model.addAttribute("department", department);
		model.addAttribute("doctors",doctors);
		return "hospitalManager/departmentDetail";
	}
	
	//获取该医院下的所有科室
	@RequestMapping("/getDepartment/{hospitalUuid}")
	@ResponseBody
	public Map<String, Object> getDepartment(@PathVariable String hospitalUuid){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(StringUtil.isNoE(hospitalUuid)) {
			map.put("result", "failure");
		} else {
			List<Department> departments = departmentService.selectDepartmentsByHospitalUUID(hospitalUuid);
			if(departments != null) {
				map.put("result", "success");
				map.put("departments", departments);
			} else {
				map.put("result", "failure");
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
}
