package top.chsis.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.util.Base64;
import com.github.pagehelper.PageInfo;

import top.chsis.exception.UserRoleException;
import top.chsis.model.Hospital;
import top.chsis.model.HospitalManager;
import top.chsis.model.Manager;
import top.chsis.service.IHospitalManagerService;
import top.chsis.service.IHospitalService;
import top.chsis.service.IManagerService;
import top.chsis.service.IRoleService;
import top.chsis.service.IUserRoleService;
import top.chsis.util.StringUtil;
import top.chsis.vo.UserRoleVO;
import top.chsis.model.Role;
import top.chsis.model.UserRole;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private IManagerService managerService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	IHospitalService hospitalService;
	
	@Autowired
	IHospitalManagerService hospitalManagerService;
	
	@Autowired
	IRoleService roleService;
	
	@Autowired
	IUserRoleService userRoleService;
	
	@RequestMapping("/manage")
	public String userManager(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(null, page, size);
		List<Manager> managers = pageInfo.getList();
		model.addAttribute("managers", managers);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "manager/manage?");
		return "admin/managerManage";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
			  						  @RequestParam(defaultValue = "5") int size,
			  						  @RequestParam(defaultValue = "") String userName,
			  						  @RequestParam(defaultValue = "") String name) {
		Manager manager = new Manager(null, userName, null, name, null, null);
		PageInfo<Manager> pageInfo = managerService.selectByConditionAndPaging(manager, page, size);
		List<Manager> managers = pageInfo.getList();
		model.addAttribute("managers", managers);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "manager/search?userName=" + userName + 
									"&name=" + name + "&" );
		return "admin/managerManage";
	}
	
	@RequestMapping("/toAddManager")
	public String toAddManager(Model model) {
		List<Hospital> hospitals = hospitalService.selectAll();
		model.addAttribute("hospitals", hospitals);
		return "admin/addManager";
	}

	@RequestMapping(value = "/addManager", method = RequestMethod.POST)
	public String addManager(Manager manager, String hospitalUuid, Model model) {
		Hospital hospital = null;
		manager.setUuid(StringUtil.getUUID());
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(manager.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		manager.setPassword(encodedPassword);
		
		if(manager.getType() == 0){
			HospitalManager hospitalManager = new HospitalManager();
			hospitalManager.setUuid(StringUtil.getUUID());
			hospital = hospitalService.selectByPrimaryKey(hospitalUuid);
			hospitalManager.setHospital(hospital);
			hospitalManager.setManager(manager);
			managerService.insertHospitalManager(manager, hospitalManager);
			model.addAttribute("hospitalName", hospital.getName());
		} else {
			managerService.insert(manager);
		}
		model.addAttribute("manager", manager);
		
		return "redirect:/manager/manage";
	}

	@RequestMapping("/checkUserNameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUserNameUnique(@PathVariable(value = "userName") String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(userName)) {
			map.put("result", "exist");
		} else {
			Manager manager = managerService.selectByUserName(userName);
			if(manager == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}

	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = managerService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/detail/{uuid}")
	@ResponseBody
	public Map<String, Object> detail(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			Manager manager = managerService.selectByPrimaryKey(uuid);
			List<UserRole> userRoles = null;
			try {
				userRoles = userRoleService.selectRolesByUserUuid(uuid);
			} catch (UserRoleException e) {
				e.printStackTrace();
			}
			if(manager != null) {
				manager.setPassword(null);
				
				//根据管理员id，判断是否是医院管理员，如果是医院管理员则展示医院名称
				HospitalManager hospitalManager = hospitalManagerService.selectByManagerUuid(uuid);
				if(hospitalManager != null && !hospitalManager.equals("")){
					Hospital hospital = hospitalManager.getHospital();
					map.put("hospitalName", hospital.getName());
				}
				
				map.put("result", "success");
				map.put("manager", manager);
				map.put("userRoles", userRoles);
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(Manager manager) {
		Map<String, Object> map = new HashMap<String, Object>();
		int update = managerService.updateByPrimaryKeySelective(manager);
		if(update == 0){
			map.put("result", "failure");
		}else {
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("/editHospitalManager")
	public String editHospitalManager(Manager manager, Model model, String hospitalUuid) {
		managerService.updateByPrimaryKeySelective(manager);
		return "redirect:/hospital/detail/" + hospitalUuid;
	}
	
	@RequestMapping("/addHospitalManager")
	public String addHospitalManager(Manager manager, String hospitalUuid, Model model) {
		manager.setUuid(StringUtil.getUUID());
		manager.setType(Manager.HOSPITAL_MANAGER);
		
		HospitalManager hospitalManager = new HospitalManager();
		hospitalManager.setUuid(StringUtil.getUUID());
		hospitalManager.setHospital(new Hospital(hospitalUuid));
		
		//Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(manager.getPassword()));
		//BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		manager.setPassword(encodedPassword);
		
		hospitalManager.setManager(manager);
		managerService.insertHospitalManager(manager, hospitalManager);
		
		return "redirect:/hospital/detail/" + hospitalUuid;
	}
	
	@RequestMapping("/toAllocateRole/{managerUuid}")
	public String toAllocateResource(@PathVariable(value = "managerUuid") String managerUuid, Model model) {
		Manager manager = null;
		manager = managerService.selectByPrimaryKey(managerUuid);
		
		//取出所有除系统角色外的普通角色
		List<Role> allRole = roleService.selectCommon();
		
		//取出该用户已经拥有的非系统角色
		List<UserRole> userRoles = null;
		//userRoles = userRoleService.selectRolesByUserUuid(managerUuid);
		userRoles = userRoleService.selectCommonRolesByUserUuid(managerUuid);
		
		//把所有角色放在map中以便快速定位
		HashMap<String, Role> map = new HashMap<String, Role>();
		for(Role r : allRole) {
			map.put(r.getUuid(), r);
		}
		//遍历已有角色的集合,在所有角色的map中取出该角色,设置该角色的description为和allocateRole.jsp上约定的 %SELECTED%@,来表明该角色已经是该用户拥有的。
		for(UserRole ur : userRoles) {
			Role role = map.get(ur.getRole().getUuid());
			role.setDescription("%SELECTED%@");
			map.put(ur.getRole().getUuid(), role);
		}
		
		if(manager.getType() == 0){
			Hospital hospital = hospitalService.selectByPrimaryKey(hospitalManagerService.selectByManagerUuid(managerUuid).getHospital().getUuid());
			model.addAttribute("hospital", hospital);
		}
		Collection<Role> roleList = map.values();
		model.addAttribute("manager", manager);
		model.addAttribute("roleList", roleList);
		
		return "admin/allocateRole";
	}

	@RequestMapping("/allocateRole")
	public String allocateResource(String managerUuid, String[] roleUuid, Model model) {
		Manager manager = null;
		manager = managerService.selectByPrimaryKey(managerUuid);
		
		// 新的角色的UUID的Set集合
		HashSet<String> newRoleSet = null;
		if(roleUuid == null || roleUuid.length == 0) {
			newRoleSet = new HashSet<String>();
		} else {
			newRoleSet = new HashSet<String>(Arrays.asList(roleUuid));
		}
		
		//取出该用户已经拥有的角色
		List<UserRole> userRoles = null;
		try {
			userRoles = userRoleService.selectRolesByUserUuid(managerUuid);
		} catch (UserRoleException e1) {
			e1.printStackTrace();
		}
		
		//遍历已有角色的集合,把角色UUID构建Set集合
		HashSet<String> oldRoleSet = new HashSet<String>();
		for(UserRole ur : userRoles) {
			oldRoleSet.add(ur.getRole().getUuid());
		}
		
		//取新角色Set与原有角色Set的交集，初始化交集为原有的角色集合
		HashSet<String> mixedRoleSet = new HashSet<String>(oldRoleSet);
		mixedRoleSet.retainAll(newRoleSet);
		
		//新角色Set减去交集部分,得到新增的角色
		newRoleSet.removeAll(mixedRoleSet);
		List<UserRoleVO> newUserRoleList = new ArrayList<UserRoleVO>();
		UserRoleVO urVo = null;
		for(String str : newRoleSet) {
			urVo = new UserRoleVO(StringUtil.getUUID(), managerUuid , str);
			newUserRoleList.add(urVo);
		}
		if(newUserRoleList.size() > 0) {
			userRoleService.insertBatchByUserRoleVO(newUserRoleList);
		}
		
		//原有资源Set减去交集部分,得到删除的资源
		oldRoleSet.removeAll(mixedRoleSet);
		List<String> deleteUserRoleList = new ArrayList<String>();
		for(String str : oldRoleSet) {
			for(UserRole ur : userRoles) {
				if(ur.getRole().getUuid().equals(str)) {
					deleteUserRoleList.add(ur.getUuid());
				}
			}
		}
		if(deleteUserRoleList.size() > 0) {
			userRoleService.deleteBatchByUuid(deleteUserRoleList);
		}
		
		//查询最新的用户角色信息
		try {
			userRoles = userRoleService.selectRolesByUserUuid(managerUuid);
		} catch (UserRoleException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("manager", manager);
		model.addAttribute("userRoles", userRoles);
		
		return "redirect:/manager/manage";
	}
}
