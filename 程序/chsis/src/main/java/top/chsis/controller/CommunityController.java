package top.chsis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.chsis.model.Community;
import top.chsis.service.ICommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private ICommunityService communityService;
	

	@RequestMapping("/getCommunityType")
	@ResponseBody
	public Map<String, Object> getCommunityType() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Community> communities = communityService.selectAll();
		
		if(communities != null) {
			map.put("result", "success");
			map.put("communities", communities);
		} else {
			map.put("result", "failure");
		}
	
		return map;
	}
	
}
