package top.chsis.security;


import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.jaas.AuthorityGranter;

import top.chsis.dao.IUserRoleMapper;
import top.chsis.model.RoleResource;
import top.chsis.model.User;
import top.chsis.model.UserRole;
import top.chsis.service.IRoleResourceService;

public class RoleUserAuthorityGranter implements AuthorityGranter {

	@Autowired
	private IUserRoleMapper userRoleMapper;
	
	@Autowired
	private IRoleResourceService roleResourceService;
	
	/*
	 * Version : 2.0
	 * 当用户登录的时候,根据实际的用户角色,角色资源的关系,设置所有用户能访问的资源为该用户的角色。角色名同上,即为 ROLE_资源UUID
	 * */
    public Set<String> grant(Principal principal) {
    	UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
    	User user = (User) token.getCredentials();
    	//获取用户所有的角色
    	List<UserRole> roles = userRoleMapper.selectRolesByUserUuid(user.getUuid());
    	//存放"角色"(ROLE_资源UUID)的集合
    	Set<String> set = new HashSet<String>();
    	//遍历所有角色
    	List<RoleResource> currentRoleResouorces = null;
    	for(UserRole ur : roles) {
    		//取出当前角色所有的资源
    		currentRoleResouorces = roleResourceService.selectByRoleUuid(ur.getRole().getUuid());
    		for(RoleResource rr : currentRoleResouorces) {
    			set.add("ROLE_" + rr.getResource().getUuid());
    		}
    	}
        return set;
    }
    
}
