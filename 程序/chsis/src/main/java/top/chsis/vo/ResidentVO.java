package top.chsis.vo;

public class ResidentVO {
	
	private String uuid;
	private String userName;//用户名
	private String name;//姓名	
	private String sex;//性别：0男、1女
	private String idNo;//身份证号
	private String phone;
	private String familyNumber;
	
	public ResidentVO() {}

	public ResidentVO(String uuid, String userName, String name, String sex, String idNo, String phone, String familyNumber) {
		super();
		this.uuid = uuid;
		this.userName = userName;
		this.name = name;
		this.sex = sex;
		this.idNo = idNo;
		this.phone = phone;
		this.familyNumber = familyNumber;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFamilyNumber() {
		return familyNumber;
	}

	public void setFamilyNumber(String familyNumber) {
		this.familyNumber = familyNumber;
	}

	@Override
	public String toString() {
		return "ResidentVO [uuid=" + uuid + ", userName=" + userName + ", name=" + name + ", sex=" + sex + ", idNo=" + idNo + ", phone=" + phone + ", familyNumber=" + familyNumber + "]";
	}
	
}
