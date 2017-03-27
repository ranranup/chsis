package top.chsis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import top.chsis.model.Community;
import top.chsis.model.Family;
import top.chsis.model.Resident;
import top.chsis.service.ICommunityService;
import top.chsis.service.IFamilyService;
import top.chsis.service.IResidentService;
import top.chsis.vo.FamilyVO;

@Controller
@RequestMapping("/family")
public class FamilyController {
	
	@Autowired
	private IFamilyService familyService;
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	ICommunityService communityService;
	
	@RequestMapping("/familyInfo")
	public String FamilyInfo(Model model){
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Resident resident = residentService.selectByUserName(userName.split("%")[0]);
		
		//根据登陆的用户查到家庭id，然后根据家庭id查到该家庭下的所有成员
		String familyUuid = resident.getFamily().getUuid();
		List<Resident> residents = residentService.selectResidentsByFamilyUUID(familyUuid);
		
		Family family = familyService.selectByPrimaryKey(familyUuid);
		String  householderUuid = family.getHouseholderUUID();
		Resident householder = residentService.selectByPrimaryKey(householderUuid);
		String householderName = householder.getName();
		
		model.addAttribute("residents", residents);
		model.addAttribute("family", family);
		model.addAttribute("householderName", householderName);
		
		return "resident/familyInfo";
	}

	@RequestMapping("/manage")
	public String manage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
		PageInfo<FamilyVO> pageInfo = familyService.selectByConditionAndPaging(null, page, size);
		List<FamilyVO> families = pageInfo.getList();
		model.addAttribute("families", families);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "family/manage?");
		
		return "admin/manageFamily";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String number,
									  @RequestParam(defaultValue = "") String householderName,
									  @RequestParam(defaultValue = "") String communityName) {
		FamilyVO familyVO = new FamilyVO(null, number, householderName, null, communityName);
		
		PageInfo<FamilyVO> pageInfo = familyService.selectByConditionAndPaging(familyVO, page, size);
		List<FamilyVO> families = pageInfo.getList();
		model.addAttribute("families", families);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "family/search?number=" + number + 
									"&householderName=" + householderName + 
									"&communityName=" + communityName + "&" );
		
		return "admin/manageFamily";
	}
	
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable String uuid,Model model){
		Family family = familyService.selectByPrimaryKey(uuid);
		String householderName =  residentService.selectByPrimaryKey(family.getHouseholderUUID()).getName();
		List<Resident> residents = residentService.selectResidentsByFamilyUUID(uuid);
		model.addAttribute("family", family);
		model.addAttribute("householderName", householderName);
		model.addAttribute("residents",residents);
		return "admin/familyDetail";
	}
	
	@RequestMapping("/editFamily")
	public String editFamily(Family family, String communityUuid){
		Community community = new Community(communityUuid);
		family.setCommunity(community);
		familyService.updateByPrimaryKeySelective(family);
		return "redirect:/family/familyInfo";
	}
}
