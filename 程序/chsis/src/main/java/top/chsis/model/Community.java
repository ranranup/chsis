package top.chsis.model;

import java.io.Serializable;

public class Community implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个社区，主键
	private String number;//社区编号
	private String name;//社区名称
	private String address;//社区地址
	private String description;//社区介绍
	
	public Community() {}

	public Community(String communityUuid) {
		this.uuid = communityUuid;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Community [uuid=" + uuid + ", number=" + number + ", name=" + name + ", address=" + address + ", description=" + description + "]";
	}
	
}
