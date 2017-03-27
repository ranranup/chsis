package top.chsis.security;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringSecurityListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent sce) {
		
		//1. 得到 Spring 的 IOC 容器
		ApplicationContext ctx = 
				WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext());
		
		//2. 从 IOC 容器中取出 FilterSecurityInterceptor 对象
		FilterSecurityInterceptor filterSecurityInterceptor = 
				ctx.getBean(FilterSecurityInterceptor.class); 
		
		//3. 从 IOC 容器中取出 securityMetadataSource
		FilterInvocationSecurityMetadataSource newSource = 
				(FilterInvocationSecurityMetadataSource) ctx.getBean("securityMetadataSource");
		
		//4. 调用 2 的 setSecurityMetadataSource 方法, 参数为 3
		filterSecurityInterceptor.setSecurityMetadataSource(newSource);
	}

	public void contextDestroyed(ServletContextEvent sce) {}

}
