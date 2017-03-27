package top.chsis.model;

import java.io.Serializable;

public class Manager implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static final int HOSPITAL_MANAGER = 0;
	public static final int CHECKER_MANAGER = 1;
	public static final int SYSTEM_MANAGER = 2;
	
	private String uuid;//唯一标识一个管理员
	private String userName;//用户名
	private String password;//密码
	private String name;//姓名
	private String phone;//电话
	private Integer type;//类型：0医院管理员、1审核员、2系统管理员
	
	public Manager() {}

	public Manager(String uuid, String userName, String password, String name, String phone, Integer type) {
		super();
		this.uuid = uuid;
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.phone = phone;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Manager [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", name=" + name + ", phone=" + phone + ", type=" + type + "]";
	}
	
}
