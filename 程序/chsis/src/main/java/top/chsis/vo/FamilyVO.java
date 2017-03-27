package top.chsis.vo;

public class FamilyVO {
	
	private String uuid;
	private String number;
	private String householderName;
	private String phone;
	private String communityName;
	
	public FamilyVO() {}
	
	public FamilyVO(String uuid, String number, String householderName, String phone, String communityName) {
		this.uuid = uuid;
		this.number = number;
		this.householderName = householderName;
		this.phone = phone;
		this.communityName = communityName;
	}
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getHouseholderName() {
		return householderName;
	}
	public void setHouseholderName(String householderName) {
		this.householderName = householderName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}

	public String toString() {
		return "FamilyVO [uuid=" + uuid + ", number=" + number + ", householderName=" + householderName + ", phone=" + phone + ", communityName=" + communityName + "]";
	}
	
}
