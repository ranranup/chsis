package top.chsis.model;

public class HospitalManager {
	
	private String uuid;
	
	private Manager manager;
	
	private Hospital hospital;

	public HospitalManager() {}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public HospitalManager(String uuid, Manager manager, Hospital hospital) {
		super();
		this.uuid = uuid;
		this.manager = manager;
		this.hospital = hospital;
	}

	public String toString() {
		return "HospitalManager [uuid=" + uuid + ", manager=" + manager + ", hospital=" + hospital + "]";
	}
}