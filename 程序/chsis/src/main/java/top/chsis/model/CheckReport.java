package top.chsis.model;

import java.io.Serializable;

public class CheckReport implements Serializable{
	private static final long serialVersionUID = 1L;
	public static final int IN_VISITING = 0;
	public static final int VISITED = 1;
	
	private String uuid;//唯一标识一条检查报告，主键 
	private String name;//报告名称
	private String description;//病情描述
	private String time;//诊察时间
	private Resident patient;//就诊病人
	private Hospital hospital;//就诊医院
	private MedicalRecord medicalRecord;//就诊记录：一个就诊记录对应多个检查报告
	private Integer state;//检查报告的状态：0检查中、1已检查
	private String url;//检查报告单存放路径
	
	public CheckReport() {}
	
	public CheckReport(String uuid, String name, String description, String time, Resident patient, Hospital hospital, MedicalRecord medicalRecord, Integer state, String url) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.description = description;
		this.time = time;
		this.patient = patient;
		this.hospital = hospital;
		this.medicalRecord = medicalRecord;
		this.state = state;
		this.url = url;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public MedicalRecord getMedicalRecord() {
		return medicalRecord;
	}

	public void setMedicalRecord(MedicalRecord medicalRecord) {
		this.medicalRecord = medicalRecord;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "CheckReport [uuid=" + uuid + ", name=" + name + ", description=" + description + ", time=" + time + ", patient=" + patient + ", hospital=" + hospital + ", medicalRecord=" + medicalRecord + ", state=" + state + ", url=" + url + "]";
	}

}
