package top.chsis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import top.chsis.model.Doctor;
import top.chsis.model.Manager;
import top.chsis.model.Resident;
import top.chsis.model.User;
import top.chsis.service.IDoctorService;
import top.chsis.service.IManagerService;
import top.chsis.service.IResidentService;

public class UserInterceptor implements HandlerInterceptor {
	
	@Autowired
	private IResidentService residentService;
	
	@Autowired
	private IDoctorService doctorService;
	
	@Autowired
	private IManagerService managerService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		User loginUser = null;
		if(request.getSession().getAttribute("loginUser") == null) {
			//获取当前登录的用户
			String userName = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String name = userName.split("%")[0];
			String type = userName.split("%")[1];
			
			if(type.equals("admin")) {
				Manager manager = managerService.selectByUserName(name);
				loginUser = new User(manager.getUuid(), manager.getUserName(), manager.getPassword(), manager.getName(), type);
			} else if(type.equals("doctor")) {
				Doctor doctor = doctorService.selectByUserName(name);
				loginUser = new User(doctor.getUuid(), doctor.getUserName(), doctor.getPassword(), doctor.getName(), type);
			} else {
				Resident resident = residentService.selectByUserName(name);
				loginUser = new User(resident.getUuid(), resident.getUserName(), resident.getPassword(), resident.getName(), type);
			}
			
			if(loginUser != null) {
				request.getSession().setAttribute("loginUser", loginUser);
				return true;
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
	}

}
