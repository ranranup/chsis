package top.chsis.security;


import java.util.List;
import java.util.Map;

public interface PrepareFilterInvocationSecurityMetadataSource {
	
	//srcMap 是 Map<String, List<String>> 类型: 其中键为 path, 值为 path 对应的 role 的集合
	//index.jsp - ["ROLE_ADMIN", "ROLE_USER"]
	//admin.jsp - ["ROLE_USER"]
	Map<String, List<String>> getSrcMap();
	
}
