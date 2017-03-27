package top.chsis.model;

import java.io.Serializable;

public class MedicalRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static final int IN_VISITING = 0;
	public static final int VISITED = 1;
	
	
	private String uuid;//唯一标识一条就诊记录，主键
	private Resident patient;//就诊病人
	private String time;//就诊时间
	private Doctor doctor;//主诊医生
	private Disease disease;//疾病名称
	private String result;//就诊结果：描述，开了啥药~
	private Integer state;//就诊记录的状态：0就诊中、1已就诊
	
	public MedicalRecord() {}
	
	public MedicalRecord(String uuid, Resident patient, String time, Doctor doctor, Disease disease, String result, Integer state) {
		super();
		this.uuid = uuid;
		this.patient = patient;
		this.time = time;
		this.doctor = doctor;
		this.disease = disease;
		this.result = result;
		this.state = state;
	}



	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Resident getPatient() {
		return patient;
	}

	public void setPatient(Resident patient) {
		this.patient = patient;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}


	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Disease getDisease() {
		return disease;
	}

	public void setDisease(Disease disease) {
		this.disease = disease;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "MedicalRecord [uuid=" + uuid + ", patient=" + patient + ", time=" + time + ", doctor=" + doctor + ", disease=" + disease + ", result=" + result + ", state=" + state + "]";
	}

}
