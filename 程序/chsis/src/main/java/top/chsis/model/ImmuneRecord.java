package top.chsis.model;

import java.io.Serializable;

public class ImmuneRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一条预防免疫记录，主键
	private Resident patient;//接种病人
	private String immuneTime;//接种时间
	private Hospital hospital;//接种医院
	private String vaccine;//疫苗名称
	
	public ImmuneRecord() {}
	
	public ImmuneRecord(String uuid, Resident patient, String immuneTime, Hospital hospital, String vaccine) {
		super();
		this.uuid = uuid;
		this.patient = patient;
		this.immuneTime = immuneTime;
		this.hospital = hospital;
		this.vaccine = vaccine;
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

	public String getImmuneTime() {
		return immuneTime;
	}

	public void setImmuneTime(String immuneTime) {
		this.immuneTime = immuneTime;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public String getVaccine() {
		return vaccine;
	}

	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	@Override
	public String toString() {
		return "ImmuneRecord [uuid=" + uuid + ", patient=" + patient + ", immuneTime=" + immuneTime + ", hospital=" + hospital + ", vaccine=" + vaccine + "]";
	}

}
