package top.chsis.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.exception.RoleException;
import top.chsis.model.Resource;
import top.chsis.model.Role;
import top.chsis.model.RoleResource;
import top.chsis.service.IResourceService;
import top.chsis.service.IRoleResourceService;
import top.chsis.service.IRoleService;
import top.chsis.util.StringUtil;
import top.chsis.vo.RoleResourceVO;

import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IResourceService resourceService;
	
	@Autowired
	private IRoleResourceService roleResourceService;
	
	@RequestMapping("/manager")
	public String toRoleManager(Model model, HttpSession session, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<Role> pageInfo = null;
		try {
			pageInfo = roleService.selectByConditionAndPaging(null, page, size);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Role> roleList = pageInfo.getList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "role/manager?");
		return "role/roleManager";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size, @RequestParam(defaultValue = "") String cName, @RequestParam(defaultValue = "") String eName) {
		Role role = new Role(null, cName, eName, null);
		PageInfo<Role> pageInfo = null;
		try {
			pageInfo = roleService.selectByConditionAndPaging(role, page, size);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Role> roleList = pageInfo.getList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "role/search?cName=" + cName + "&cName=" + eName + "&");
		return "role/roleManager";
	}
	
	@RequestMapping("/detail/{roleUuid}")
	public String roleDetail(@PathVariable(value = "roleUuid") String roleUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		//取出最新的资源的集合
		List<RoleResource> roleResourceList = roleResourceService.selectByRoleUuid(roleUuid);
		model.addAttribute("role", role);
		model.addAttribute("roleResourceList", roleResourceList);
		return "role/roleDetail";
	}
	
	@RequestMapping("/delete/{roleUuid}")
	@ResponseBody
	public Map<String, Object> roleDelte(@PathVariable(value = "roleUuid") String roleUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			roleService.deleteByPrimaryKey(roleUuid);
			map.put("result", "success");
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", e.getMessage());
		}
		return map;
	}
	
	@RequestMapping("/toAddRole")
	public String toAddRole() {
		return "role/addRole";
	}
	
	@RequestMapping("/addRole")
	public String addRole(Role role, Model model) {
		if(role.geteName().isEmpty() || role.getcName().isEmpty()) {
			return "error";
		} else {
			role.setUuid(StringUtil.getUUID());
			try {
				roleService.insert(role);
				model.addAttribute("role", role);
				return "role/roleDetail";
			} catch (RoleException e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "error";
			}
		}
	}
	
	@RequestMapping("/toUpdate/{roleUuid}")
	public String toUpdate(@PathVariable(value = "roleUuid") String roleUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("role", role);
		return "role/updateRole";
	}
	
	@RequestMapping("/update")
	public String roleUpdate(Role role, Model model) {
		try {
			roleService.updateByPrimaryKey(role);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		return "redirect:/role/detail/" + role.getUuid();
	}
	
	@RequestMapping("/toAllocateResource/{roleUuid}")
	public String toAllocateResource(@PathVariable(value = "roleUuid") String roleUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		//取出所有资源
		List<Resource> allResource = resourceService.selectAll();
		//取出该角色已经拥有的资源
		List<RoleResource> roleResources = roleResourceService.selectByRoleUuid(roleUuid);
		//把所有资源放在map中以便快速定位
		HashMap<String, Resource> map = new HashMap<String, Resource>();
		for(Resource r : allResource) {
			map.put(r.getUuid(), r);
		}
		//遍历已有资源的集合,在所有资源的map中取出该资源,设置该资源的description为和allocateResource.jsp上约定的 %SELECTED%@,来表明该资源已经是该角色拥有的。
		for(RoleResource rr : roleResources) {
			Resource resource = map.get(rr.getResource().getUuid());
			resource.setDescription("%SELECTED%@");
			map.put(rr.getResource().getUuid(), resource);
		}
		
		Collection<Resource> resourceList = map.values();
		model.addAttribute("role", role);
		model.addAttribute("resourceList", resourceList);
		
		return "role/allocateResource";
	}

	@RequestMapping("/allocateResource")
	public String allocateResource(String roleUuid, String[] resourceUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		//新的资源的UUID的Set集合
		HashSet<String> newResourceSet = new HashSet<String>(Arrays.asList(resourceUuid));
		//取出该角色已经拥有的资源
		List<RoleResource> roleResources = roleResourceService.selectByRoleUuid(roleUuid);
		
		//遍历已有资源的集合,把资源UUID构建Set集合
		HashSet<String> oldResourceSet = new HashSet<String>();
		for(RoleResource rr : roleResources) {
			oldResourceSet.add(rr.getResource().getUuid());
		}
		
		//取新资源Set与原有资源Set的交集，初始化交集为原有的资源集合
		HashSet<String> mixedResourceSet = new HashSet<String>(oldResourceSet);
		mixedResourceSet.retainAll(newResourceSet);
		
		//新资源Set减去交集部分,得到新增的资源
		newResourceSet.removeAll(mixedResourceSet);
		List<RoleResourceVO> newRoleResourceList = new ArrayList<RoleResourceVO>();
		RoleResourceVO rrVo = null;
		for(String str : newResourceSet) {
			rrVo = new RoleResourceVO(StringUtil.getUUID(), roleUuid , str);
			newRoleResourceList.add(rrVo);
		}
		if(newRoleResourceList.size() > 0) {
			roleResourceService.insertBatch(newRoleResourceList);
		}
		
		
		//原有资源Set减去交集部分,得到删除的资源
		oldResourceSet.removeAll(mixedResourceSet);
		List<String> deleteRoleResourceList = new ArrayList<String>();
		for(String str : oldResourceSet) {
			for(RoleResource rr : roleResources) {
				if(rr.getResource().getUuid().equals(str)) {
					deleteRoleResourceList.add(rr.getUuid());
				}
			}
		}
		if(deleteRoleResourceList.size() > 0) {
			roleResourceService.deleteBatchByUuid(deleteRoleResourceList);
		}
		
		return "redirect:/role/detail/" + roleUuid;
	}

	
	@RequestMapping("/checkRoleENameUnique/{eName}")
	@ResponseBody
	public Map<String, Object> checkRoleENameUnique(@PathVariable(value = "eName") String eName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Role role = null;
		try {
			role = roleService.selectByEName(eName);
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(role != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
	@RequestMapping("/checkRoleCNameUnique/{cName}")
	@ResponseBody
	public Map<String, Object> checkRoleCNameUnique(@PathVariable(value = "cName") String cName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Role role = null;
		try {
			role = roleService.selectByCName(cName);
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(role != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
}
 