package top.chsis.vo;

public class RoleResourceVO {
	
	private String uuid;
	
	private String roleUuid;
	
	private String resourceUuid;

	public RoleResourceVO() {}

	public RoleResourceVO(String uuid, String roleUuid, String resourceUuid) {
		super();
		this.uuid = uuid;
		this.roleUuid = roleUuid;
		this.resourceUuid = resourceUuid;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getRoleUuid() {
		return roleUuid;
	}

	public void setRoleUuid(String roleUuid) {
		this.roleUuid = roleUuid;
	}

	public String getResourceUuid() {
		return resourceUuid;
	}

	public void setResourceUuid(String resourceUuid) {
		this.resourceUuid = resourceUuid;
	}

	public String toString() {
		return "RoleResourceVO [uuid=" + uuid + ", roleUuid=" + roleUuid + ", resourceUuid=" + resourceUuid + "]";
	}
	
}
