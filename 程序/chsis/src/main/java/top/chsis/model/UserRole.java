package top.chsis.model;

public class UserRole {
	
	private String uuid;
	
	private String userUuid;
	
	private Role role;

	public UserRole() {}

	public UserRole(String uuid, String userUuid, Role role) {
		super();
		this.uuid = uuid;
		this.userUuid = userUuid;
		this.role = role;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String toString() {
		return "UserRole [uuid=" + uuid + ", userUuid=" + userUuid + ", role=" + role + "]";
	}
	
}