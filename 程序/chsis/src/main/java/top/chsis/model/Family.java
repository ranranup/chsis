package top.chsis.model;

import java.io.Serializable;

public class Family implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个家庭，主键
	private String number;//家庭编号
	private String phone;//家庭电话
	private String address;//家庭住址
	private String householderUUID;//户主
	private Community community;//属于哪个社区
	
	public Family() {}

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHouseholderUUID() {
		return householderUUID;
	}

	public void setHouseholderUUID(String householderUUID) {
		this.householderUUID = householderUUID;
	}

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}

	@Override
	public String toString() {
		return "Family [uuid=" + uuid + ", number=" + number + ", phone=" + phone + ", address=" + address + ", householderUUID=" + householderUUID + ", community=" + community + "]";
	}

}
