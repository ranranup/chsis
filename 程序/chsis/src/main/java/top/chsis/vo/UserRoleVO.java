package top.chsis.vo;

public class UserRoleVO {
	
	private String uuid;
	
	private String userUuid;
	
	private String roleUuid;

	public UserRoleVO() {}

	public UserRoleVO(String uuid, String userUuid, String roleUuid) {
		super();
		this.uuid = uuid;
		this.userUuid = userUuid;
		this.roleUuid = roleUuid;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserUuid() {
		return userUuid;
	}

	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}

	public String getRoleUuid() {
		return roleUuid;
	}

	public void setRoleUuid(String roleUuid) {
		this.roleUuid = roleUuid;
	}

	@Override
	public String toString() {
		return "UserRoleVO [uuid=" + uuid + ", userUuid=" + userUuid + ", roleUuid=" + roleUuid + "]";
	}
	
}
