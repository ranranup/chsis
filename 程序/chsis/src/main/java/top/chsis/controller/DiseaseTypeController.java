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

import top.chsis.model.DiseaseType;
import top.chsis.service.IDiseaseTypeService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/diseaseType")
public class DiseaseTypeController {
	
	@Autowired
	private IDiseaseTypeService diseaseTypeService;
	
	@RequestMapping("/manage")
	public String manage(Model model) {
		List<DiseaseType> diseaseTypes = diseaseTypeService.selectByLevel(1);
		model.addAttribute("size", diseaseTypes.size());
		model.addAttribute("diseaseTypes", diseaseTypes);
		return "disease/diseaseTypeTable";
	}
	
	@RequestMapping("/list/{uuid}")
	public String list(Model model, @PathVariable String uuid) {
		DiseaseType currentType = diseaseTypeService.selectByPrimaryKey(uuid);
		DiseaseType parentType = null;
		List<DiseaseType> diseaseTypes = diseaseTypeService.selectByParentDiseaseType(uuid);
		if(currentType.getLevel() == 2) {
			parentType = diseaseTypeService.selectByPrimaryKey(currentType.getParentTypeUuid());
		}
		model.addAttribute("size", diseaseTypes.size());
		model.addAttribute("diseaseTypes", diseaseTypes);
		model.addAttribute("currentType", currentType);
		model.addAttribute("parentType", parentType);
		return "disease/diseaseTypeTable";
	}
	
	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, String> delete(Model model, @PathVariable String uuid) {
		Map<String, String> map = new HashMap<String, String>();
		int i = diseaseTypeService.deleteByPrimaryKey(uuid);
		if(i == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/add")
	public String add(DiseaseType diseaseType) {
		diseaseType.setUuid(StringUtil.getUUID());
		if(StringUtil.isNoE(diseaseType.getParentTypeUuid())) {
			diseaseType.setParentTypeUuid("1");
		}
		diseaseTypeService.insert(diseaseType);
		if(diseaseType.getParentTypeUuid().equals("1")) {
			return "redirect:/diseaseType/manage";
		}
		return "redirect:/diseaseType/list/" + diseaseType.getParentTypeUuid();
	}
	
	//检查疾病类型名称是否重复
	@RequestMapping("/checkDiseaseTypeNameUnique/{name}")
	@ResponseBody
	public Map<String, Object> checkDiseaseTypeNameUnique(@PathVariable String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(name)) {
			map.put("result", "exist");
		} else {
			DiseaseType diseaseType = diseaseTypeService.selectByName(name);
			if(diseaseType == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	@RequestMapping("/getDiseaseType/{level}")
	@ResponseBody
	public Map<String, Object> getDiseaseType(@PathVariable String level) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<DiseaseType> diseaseTypes = null;
		if(level.equals("one")) {
			diseaseTypes = diseaseTypeService.selectByLevel(1);
		}
		if(diseaseTypes != null) {
			map.put("result", "success");
			map.put("diseaseTypes", diseaseTypes);
		} else {
			map.put("result", "failure");
		}
	
		return map;
	}
	
	@RequestMapping("/getByParent/{uuid}")
	@ResponseBody
	public Map<String, Object> getByParent(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<DiseaseType> diseaseTypes = diseaseTypeService.selectByParentDiseaseType(uuid);
		if(diseaseTypes != null) {
			map.put("result", "success");
			map.put("diseaseTypes", diseaseTypes);
		} else {
			map.put("result", "failure");
		}
	
		return map;
	}
}
