package top.chsis.model;

public class User {
	private String uuid;
	private String userName;
	private String password;
	private String name;
	private String type;
	
	public User() {}
	
	public User(String uuid, String userName, String password, String name, String type) {
		super();
		this.uuid = uuid;
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.type = type;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "User [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", name=" + name + ", type=" + type + "]";
	}
	
}
