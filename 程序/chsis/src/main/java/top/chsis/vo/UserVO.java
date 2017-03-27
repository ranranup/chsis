package top.chsis.vo;

/**
 * 
 * @ClassName: UserVO
 * @Description:用户的VO类 
 * @author: Way
 * @date: 2016年2月28日
 */
public class UserVO {
	private String username;
	private String name;
	private String companyUuid;
	
	public UserVO() {}
	
	public UserVO(String username, String name, String companyUuid) {
		this.username = username;
		this.name = name;
		this.companyUuid = companyUuid;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyUuid() {
		return companyUuid;
	}
	public void setCompanyUuid(String companyUuid) {
		this.companyUuid = companyUuid;
	}
	
}
