package top.chsis.controller;

import java.util.HashMap;
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

import com.github.pagehelper.PageInfo;

import top.chsis.exception.ResourceException;
import top.chsis.model.Resource;
import top.chsis.service.IResourceService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	
	@Autowired
	private IResourceService resourceService;
	
	@RequestMapping("/manager")
	public String toResourceManager(Model model, HttpSession session, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<Resource> pageInfo = null;
		try {
			pageInfo = resourceService.selectByConditionAndPaging(null, page, size);
		} catch (ResourceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Resource> resourceList = pageInfo.getList();
		model.addAttribute("resourceList", resourceList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resource/manager?");
		return "resource/resourceManager";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size, @RequestParam(defaultValue = "") String url, @RequestParam(defaultValue = "") String name) {
		Resource resource = new Resource(null, name, url, null);
		PageInfo<Resource> pageInfo = null;
		try {
			pageInfo = resourceService.selectByConditionAndPaging(resource, page, size);
		} catch (ResourceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Resource> resourceList = pageInfo.getList();
		model.addAttribute("resourceList", resourceList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "resource/search?url=" + url + "&name=" + name + "&");
		return "resource/resourceManager";
	}
	
	@RequestMapping("/detail/{resourceUuid}")
	public String resourceDetail(@PathVariable(value = "resourceUuid") String resourceUuid, Model model) {
		Resource resource = null;
		try {
			resource = resourceService.selectByPrimaryKey(resourceUuid);
		} catch (ResourceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("resource", resource);
		return "resource/resourceDetail";
	}
	
	@RequestMapping("/delete/{resourceUuid}")
	@ResponseBody
	public Map<String, Object> resourceDelte(@PathVariable(value = "resourceUuid") String resourceUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			resourceService.deleteByPrimaryKey(resourceUuid);
			map.put("result", "success");
		} catch (ResourceException e) {
			e.printStackTrace();
			map.put("result", e.getMessage());
		}
		return map;
	}
	
	@RequestMapping("/toAddResource")
	public String toAddResource() {
		return "resource/addResource";
	}

	@RequestMapping("/addResource")
	public String toAddResource(Resource resource, Model model) {
		if(resource.getName().isEmpty() || resource.getUrl().isEmpty()) {
			return "error";
		} else {
			resource.setUuid(StringUtil.getUUID());
			try {
				resourceService.insert(resource);
				model.addAttribute("resource", resource);
				return "resource/resourceDetail";
			} catch (ResourceException e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "error";
			}
		}
	}
	
	@RequestMapping("/toUpdate/{resourceUuid}")
	public String toUpdate(@PathVariable(value = "resourceUuid") String resourceUuid, Model model) {
		Resource resource = null;
		try {
			resource = resourceService.selectByPrimaryKey(resourceUuid);
		} catch (ResourceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("resource", resource);
		return "resource/updateResource";
	}
	
	@RequestMapping("/update")
	public String resourceUpdate(Resource resource, Model model) {
		try {
			resourceService.updateByPrimaryKey(resource);
		} catch (ResourceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("resource", resource);
		return "resource/resourceDetail";
	}
	
	@RequestMapping("/checkNameUnique/{name}")
	@ResponseBody
	public Map<String, Object> checkNameUnique(@PathVariable(value = "name") String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		Resource resource = null;
		try {
			resource = resourceService.selectByName(name);
		} catch (ResourceException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(resource != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
	@RequestMapping("/checkURLUnique")
	@ResponseBody
	public Map<String, Object> checkURLUnique(String url) {
		Map<String, Object> map = new HashMap<String, Object>();
		Resource resource = null;
		try {
			resource = resourceService.selectByURL(url);
		} catch (ResourceException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(resource != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}

}
