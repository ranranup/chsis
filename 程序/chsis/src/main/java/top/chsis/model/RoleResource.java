package top.chsis.model;

public class RoleResource {
	
	private String uuid;
	
	private Role role;
	
	private Resource resource;

	public RoleResource() {}

	public RoleResource(String uuid, Role role, Resource resource) {
		super();
		this.uuid = uuid;
		this.role = role;
		this.resource = resource;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public String toString() {
		return "RoleResource [uuid=" + uuid + ", role=" + role + ", resource=" + resource + "]";
	}

}
