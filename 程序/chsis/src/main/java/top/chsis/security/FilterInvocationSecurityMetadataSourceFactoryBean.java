package top.chsis.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.access.intercept.DefaultFilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

public class FilterInvocationSecurityMetadataSourceFactoryBean implements FactoryBean<FilterInvocationSecurityMetadataSource> {

	private PrepareFilterInvocationSecurityMetadataSource prepareFilterInvocationSecurityMetadataSource;

	public void setPrepareFilterInvocationSecurityMetadataSource(PrepareFilterInvocationSecurityMetadataSource prepareFilterInvocationSecurityMetadataSource) {
		this.prepareFilterInvocationSecurityMetadataSource = prepareFilterInvocationSecurityMetadataSource;
	}

	// 返回实际的对象
	public FilterInvocationSecurityMetadataSource getObject() throws Exception {

		Map<String, List<String>> srcMap = prepareFilterInvocationSecurityMetadataSource.getSrcMap();

		/*************************************************************/

		LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap = new LinkedHashMap();

		for (Map.Entry<String, List<String>> entry : srcMap.entrySet()) {
			String path = entry.getKey();
			List<String> roles = entry.getValue();

			RequestMatcher matcher = new AntPathRequestMatcher(path);
			Collection<ConfigAttribute> attributes = new ArrayList();

			for (String role : roles) {
				attributes.add(new SecurityConfig(role));
			}

			requestMap.put(matcher, attributes);
		}

		FilterInvocationSecurityMetadataSource filterInvocationSecurityMetadataSource = new DefaultFilterInvocationSecurityMetadataSource(requestMap);
		return filterInvocationSecurityMetadataSource;
	}

	// 实际返回的 Bean 的类型
	public Class<?> getObjectType() {
		return FilterInvocationSecurityMetadataSource.class;
	}

	// 返回的 Bean 对象是否为单例
	public boolean isSingleton() {
		return true;
	}

}
