package top.chsis.model;

public class Role {
	
	private String uuid;
	
	private String cName;//中文角色名
	
	private String eName;//英文角色名
	
	private String description;//角色描述

	public Role() {}
	
	public Role(String uuid) {
		this.uuid = uuid;
	}

	public Role(String uuid, String cName, String eName, String description) {
		super();
		this.uuid = uuid;
		this.cName = cName;
		this.eName = eName;
		this.description = description;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String toString() {
		return "Role [uuid=" + uuid + ", cName=" + cName + ", eName=" + eName + ", description=" + description + "]";
	}
	
}
