package top.chsis.model;

import java.io.Serializable;

public class Department implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个科室，主键
	private String name;//科室名称
	private String number;//科室编号
	private String description;//科室描述
	private Hospital hospital;//所属医院
	
	public Department() {}

	public Department(String uuid) {
		this.uuid = uuid;
	}
	
	public Department(String uuid, String number, String name, Hospital hospital) {
		this.uuid = uuid;
		this.number = number;
		this.name = name;
		this.hospital = hospital;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	@Override
	public String toString() {
		return "Department [uuid=" + uuid + ", name=" + name + ", number=" + number + ", description=" + description + ", hospital=" + hospital + "]";
	}
	
}
