package top.chsis.vo;

public class DoctorVO {
	private String uuid;
	private String number;
	private String name;
	private String departmentName;
	private String hospitalUuid;
	
	public DoctorVO(){}
	
	public DoctorVO(String uuid, String number, String name, String departmentName, String hospitalUuid) {
		super();
		this.uuid = uuid;
		this.number = number;
		this.name = name;
		this.departmentName = departmentName;
		this.hospitalUuid = hospitalUuid;
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getHospitalUuid() {
		return hospitalUuid;
	}
	public void setHospitalUuid(String hospitalUuid) {
		this.hospitalUuid = hospitalUuid;
	}

	@Override
	public String toString() {
		return "DoctorVO [uuid=" + uuid + ", number=" + number + ", name=" + name + ", departmentName=" + departmentName + ", hospitalUuid=" + hospitalUuid + "]";
	}
	
}
