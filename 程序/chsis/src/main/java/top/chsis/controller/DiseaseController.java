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

import top.chsis.model.Disease;
import top.chsis.model.DiseaseType;
import top.chsis.service.IDiseaseService;
import top.chsis.service.IDiseaseTypeService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/disease")
public class DiseaseController {
	
	@Autowired
	private IDiseaseService diseaseService;
	
	@Autowired
	private IDiseaseTypeService diseaseTypeService;
	
	/*
	 * 根据疾病类型查询疾病
	 */
	@RequestMapping("/list/{uuid}")
	public String list(Model model, @PathVariable String uuid) {
		DiseaseType currentType = diseaseTypeService.selectByPrimaryKey(uuid);
		DiseaseType parentType = null;
		List<Disease> diseases = diseaseService.selectByDiseaseType(uuid);
		if(currentType.getLevel() == 2) {
			parentType = diseaseTypeService.selectByPrimaryKey(currentType.getParentTypeUuid());
		}
		model.addAttribute("size", diseases.size());
		model.addAttribute("diseases", diseases);
		model.addAttribute("currentType", currentType);
		model.addAttribute("parentType", parentType);
		return "disease/diseaseTable";
	}
	
	@RequestMapping("/add")
	public String add(Disease disease) {
		disease.setUuid(StringUtil.getUUID());
		diseaseService.insert(disease);
		return "redirect:/disease/list/" + disease.getDiseaseType().getUuid();
	}

	@RequestMapping("/delete/{uuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(uuid)) {
			map.put("result", "failure");
		} else {
			int result = diseaseService.deleteByPrimaryKey(uuid);
			if(result == 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failure");
			}
		}
		return map;
	}
	
	//检查疾病名称是否重复
	@RequestMapping("/checkDiseaseUnique/{name}")
	@ResponseBody
	public Map<String, Object> checkDiseaseUnique(@PathVariable String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNoE(name)) {
			map.put("result", "exist");
		} else {
			Disease disease = diseaseService.selectByName(name);
			if(disease == null) {
				map.put("result", "inexistence");
			} else {
				map.put("result", "exist");
			}
		}
		return map;
	}
	
	@RequestMapping("/getByDiseaseType/{uuid}")
	@ResponseBody
	public Map<String, Object> getByDiseaseType(@PathVariable String uuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Disease> diseases = diseaseService.selectByDiseaseType(uuid);
		if(diseases != null) {
			map.put("result", "success");
			map.put("diseases", diseases);
		} else {
			map.put("result", "failure");
		}
	
		return map;
	}
}
