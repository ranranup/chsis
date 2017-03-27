package top.chsis.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import top.chsis.dao.IResourceMapper;
import top.chsis.model.Resource;

public class PrepareFilterInvocationSecurityMetadataSourceImpl implements PrepareFilterInvocationSecurityMetadataSource {

	@Autowired
	private IResourceMapper resourceMapper;

	
	/*
	 * Version : 2.0
	 * srcMap中一个"角色"对应一个资源,不是实际上的角色与资源的关系
	 * 此时的"角色名"是  ROLE_资源UUID
	 * 当用户登录的时候,RoleUserAuthorityGranter.java根据实际的用户角色,角色资源的关系,设置所有用户能访问的资源为该用户的角色。角色名同上,即为 ROLE_资源UUID
	 * */
	public Map<String, List<String>> getSrcMap() {
		// 先创建一个 srcMap, 然后再由 srcMap 来构建 requestMap
		// srcMap 是 Map<String, List<String>> 类型: 其中键为 path, 值为 path 对应的 role的集合
		// index.jsp - ["ROLE_ADMIN", "ROLE_USER"]
		// admin.jsp - ["ROLE_USER"]
		
		Map<String, List<String>> srcMap = new HashMap<String, List<String>>();
		
		List<Resource> allResource = resourceMapper.selectAll();

		for (Resource resource : allResource) {
			String path = resource.getUrl();
			String role = "ROLE_" + resource.getUuid();
			List<String> roles = new ArrayList<String>();
			roles.add(role);
			srcMap.put(path, roles);
		}
		return srcMap;
	}

	
	/*
	 * Version : 1.0
	 * srcMap中一个角色对应多个资源,是实际上的角色与资源的关系
	 *
	 *
	@Autowired
	private IRoleResourceMapper roleResourceMapper;
	
	public Map<String, List<String>> getSrcMap() {
		// 先创建一个 srcMap, 然后再由 srcMap 来构建 requestMap
		// srcMap 是 Map<String, List<String>> 类型: 其中键为 path, 值为 path 对应的 role的集合
		// index.jsp - ["ROLE_ADMIN", "ROLE_USER"]
		// admin.jsp - ["ROLE_USER"]
		
		Map<String, List<String>> srcMap = new HashMap<String, List<String>>();
		
		List<RoleResource> list = roleResourceMapper.selectAll();

		for (RoleResource roleResource : list) {
			String path = roleResource.getResource().getUrl();
			String role = roleResource.getRole().geteName();

			List<String> roles = srcMap.get(path);
			if (!srcMap.containsKey(path)) {
				roles = new ArrayList<>();
				srcMap.put(path, roles);
			}
			roles.add(role);
		}
		return srcMap;
	}
	
	 */

}
