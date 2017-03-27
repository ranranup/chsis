package top.chsis.model;

import java.io.Serializable;

public class DiseaseHistory implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一种疾病类型、主键
	private String name;//疾病名称
	private Integer type;//疾病类型:0遗传病史、1重大疾病史、2手术史、3过敏史
	private String startTime;//开始时间
	private String endTime;//痊愈时间
	private String description;//病情描述
	private Resident patient;//病人
	
	public DiseaseHistory() {}

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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "MedicalHistory [uuid=" + uuid + ", name=" + name + ", type=" + type + ", startTime=" + startTime + ", endTime=" + endTime + ", description=" + description + ", patient=" + patient + "]";
	}

}
