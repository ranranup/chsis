package top.chsis.model;

import java.io.Serializable;

public class Hospital implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一家医院，主键
	private String number;//医院编号
	private String name;//医院名称
	private String address;//医院地址
	private String description;//医院描述
	
	public Hospital() {}

	public Hospital(String hospitalUuid) {
		this.uuid = hospitalUuid;
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
		return "Hospital [uuid=" + uuid + ", number=" + number + ", name=" + name + ", address=" + address + ", description=" + description +  "]";
	}

}
