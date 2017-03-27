package top.chsis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import top.chsis.model.CheckRecord;
import top.chsis.model.Doctor;
import top.chsis.model.Manager;
import top.chsis.model.News;
import top.chsis.service.ICheckRecordService;
import top.chsis.service.IDoctorService;
import top.chsis.service.IManagerService;
import top.chsis.service.INewsService;
import top.chsis.util.StringUtil;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IManagerService managerService;
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICheckRecordService checkRecordService;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("/manage")
	public String manage(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size){
		News news = new News();
		//返回页面,默认是新闻提交者看到的页面
		String returnPage = "news/newsManage";
		//获取当前登录的用户
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = temp.split("%")[0];
		String type = temp.split("%")[1];
		if(type.equals("admin")) {
			Manager manager = managerService.selectByUserName(userName);
			if(manager.getType() != Manager.CHECKER_MANAGER) {
				news.setAuthorUuid(manager.getUuid());
			} else {
				returnPage = "news/newsManageChecker";
				news.setState(News.STATE_CHECKING);
			}
		} else {
			Doctor doctor = doctorService.selectByUserName(userName);
			news.setAuthorUuid(doctor.getUuid());
		}
		
		PageInfo<News> pageInfo = newsService.selectByCondition(news, page, size);
		List<News> newsList = pageInfo.getList();
		model.addAttribute("newsList", newsList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "news/manage?");
		
		return returnPage;
	}
	
	@RequestMapping("/search")
	public String doctorSearch(Model model, @RequestParam(defaultValue = "1") int page,
									  @RequestParam(defaultValue = "5") int size,
									  @RequestParam(defaultValue = "") String title,
									  @RequestParam(defaultValue = "") String type,
									  @RequestParam(defaultValue = "") String submitTime,
									  @RequestParam(defaultValue = "") String state) {
		//返回页面,默认是新闻提交者看到的页面
		String returnPage = "news/newsManage";
		//获取当前登录的用户
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userName = temp.split("%")[0];
		String userType = temp.split("%")[1];
		String authorUuid = null;
		if(userType.equals("admin")) {
			Manager manager = managerService.selectByUserName(userName);
			if(manager.getType() != Manager.CHECKER_MANAGER) {
				authorUuid = manager.getUuid();
			} else {
				returnPage = "news/newsManageChecker";
				//审核员默认查审核中的新闻
				if(StringUtil.isNoE(state)) {
					state = "0";
				}
			}
		} else {
			Doctor doctor = doctorService.selectByUserName(userName);
			authorUuid = doctor.getUuid();
		}
		News news = null;
		Integer realState = null;
		Integer realType = null;
		if(!StringUtil.isNoE(state)){
			if(!state.equals("-1")) {
				realState = Integer.parseInt(state);
				model.addAttribute("state", state);
			}
		} 
		if(!StringUtil.isNoE(type)){
			realType = Integer.parseInt(type);
			model.addAttribute("type", type);
		} 
		news = new News(null, title, authorUuid, realType, submitTime, realState);
		
		PageInfo<News> pageInfo = newsService.selectByCondition(news, page, size);
		List<News> newsList = pageInfo.getList();
		model.addAttribute("newsList", newsList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "news/search?title=" + title + 
									"&submitTime=" + submitTime+
									"&type=" + type+
									"&state" + state + "&" );
		
		return returnPage;
	}
	
	@RequestMapping("/toPublish")
	public String publishNews(Model model){
		String temp = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String type = temp.split("%")[1];
		if(type.equals("doctor")) {
			model.addAttribute("role", "doctor");
		} else {
			model.addAttribute("role", "manager");
		}
		return "news/publishNews";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(News news) {
		Map<String, Object> map = new HashMap<String, Object>();
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String realUserName = userName.split("%")[0];
		String type = userName.split("%")[1];
		int insert = 0;
		news.setUuid(StringUtil.getUUID());
		if(type.equals("doctor")) {
			Doctor doctor = doctorService.selectByUserName(realUserName);
			news.setAuthorUuid(doctor.getUuid());
			news.setAuthorType(News.AUTHOR_DOCTOR);
			news.setAuthorName(doctor.getName());
		} else if (type.equals("admin")) {
			Manager manager = managerService.selectByUserName(realUserName);
			news.setAuthorUuid(manager.getUuid());
			if(manager.getType() == Manager.SYSTEM_MANAGER){
				news.setAuthorType(News.AUTHOR_SYSTEMMANAGER);
				news.setType(News.TYPE_COMMUNITY_ANNOCEMNET);
			} else if(manager.getType() == Manager.HOSPITAL_MANAGER) {
				news.setAuthorType(News.AUTHOR_HOSPITALMANAGER);
				news.setType(News.TYPE_HOSPITAL_NOTICE);
			}
			news.setAuthorName(manager.getName());
		}
		
		news.setSubmitTime(sdf.format(new Date()));
		news.setState(News.STATE_CHECKING);
		insert = newsService.insertSelective(news);
		
		if(insert == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/detail/{uuid}")
	public String detail(@PathVariable("uuid") String uuid, Model model) {
		News news = newsService.selectByPrimaryKey(uuid);
		List<CheckRecord> checkRecords = checkRecordService.selectByNewsUuid(uuid);
		if(news == null) {
			return "redirect:/index";
		}
		if(checkRecords != null) {
			model.addAttribute("checkRecords", checkRecords);
		}
		model.addAttribute("news", news);
		
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String realUserName = userName.split("%")[0];
		String type = userName.split("%")[1];
		//判断如果当前用户是审核员，跳转到审核员管理的详情页
		if(type.equals("admin")) {
			Manager manager = managerService.selectByUserName(realUserName);
			if(manager.getType() == Manager.CHECKER_MANAGER){
				return "news/newsDetailChecker";
			}
		}
		//默认跳转到发布者看到的新闻详情页
		return "news/newsDetail";
	}
	
	@RequestMapping("/toEdit/{uuid}")
	public String toEdit(@PathVariable("uuid") String uuid, Model model) {
		News news = null;
		news = newsService.selectByPrimaryKey(uuid);
		model.addAttribute("news", news);
		return "news/editNews";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(News news) {
		Map<String, Object> map = new HashMap<String, Object>();
		news.setState(News.STATE_CHECKING);
		int update = newsService.updateByPrimaryKeySelective(news);
		if(update == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/delete/{newsUuid}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable(value = "newsUuid") String newsUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		int result = newsService.deleteByPrimaryKey(newsUuid);
		if(result == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/pass")
	@ResponseBody
	public Map<String, Object> pass(CheckRecord checkRecord) {
		Map<String, Object> map = new HashMap<String, Object>();
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Manager checker = managerService.selectByUserName(userName.split("%")[0]);
		checkRecord.setUuid(StringUtil.getUUID());
		checkRecord.setResult(CheckRecord.PASS);
		checkRecord.setTime(sdf.format(new Date()));
		checkRecord.setChecker(checker);
		int result = checkRecordService.check(checkRecord, true);
		if(result == 2) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
	
	@RequestMapping("/notPass")
	@ResponseBody
	public Map<String, Object> notPass(CheckRecord checkRecord) {
		Map<String, Object> map = new HashMap<String, Object>();
		//获取当前登录的用户
		String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Manager checker = managerService.selectByUserName(userName.split("%")[0]);
		checkRecord.setUuid(StringUtil.getUUID());
		checkRecord.setResult(CheckRecord.NOTPASS);
		checkRecord.setTime(sdf.format(new Date()));
		checkRecord.setChecker(checker);
		int result = checkRecordService.check(checkRecord, false);
		if(result == 2) {
			map.put("result", "success");
		} else {
			map.put("result", "failure");
		}
		return map;
	}
}
