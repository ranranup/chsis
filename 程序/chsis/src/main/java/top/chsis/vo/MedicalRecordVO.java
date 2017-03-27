package top.chsis.vo;

import top.chsis.model.Disease;
import top.chsis.model.Resident;

public class MedicalRecordVO {
	
	private String uuid;
	private String name;//姓名	
	private String sex;//性别：0男、1女
	private String idNo;//身份证号
	private String time;//就诊时间
	private Disease disease;//疾病名称
	private String doctorUuid;//医生的id
	private String state;//就诊记录的状态：0就诊中、1已就诊
	private String result;//就诊结果
	private Resident patient;//就诊病人
	public MedicalRecordVO() {}

	public MedicalRecordVO(String uuid, String name, String sex, String idNo, String time, Disease disease, String doctorUuid, String state, String result) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.sex = sex;
		this.idNo = idNo;
		this.time = time;
		this.disease = disease;
		this.doctorUuid = doctorUuid;
		this.state = state;
		this.result = result;
	}

	public MedicalRecordVO(String uuid, String time, Disease disease, String state,Resident patient) {
		super();
		this.uuid = uuid;
		this.time = time;
		this.disease = disease;
		this.state = state;
		this.patient = patient;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Disease getDisease() {
		return disease;
	}

	public void setDisease(Disease disease) {
		this.disease = disease;
	}

	public String getDoctorUuid() {
		return doctorUuid;
	}

	public void setDoctorUuid(String doctorUuid) {
		this.doctorUuid = doctorUuid;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "MedicalRecordVO [uuid=" + uuid + ", name=" + name + ", sex=" + sex + ", idNo=" + idNo + ", time=" + time + ", disease=" + disease + ", doctorUuid=" + doctorUuid + ", state=" + state + ", result=" + result + ", patient=" + patient + "]";
	}
	
}
