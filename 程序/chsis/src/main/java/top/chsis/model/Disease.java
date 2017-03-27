package top.chsis.model;

public class Disease {
	
	private String uuid;
	private String name;
	private DiseaseType diseaseType;
	
	public Disease() {}
	
	public Disease(String uuid, String name, DiseaseType diseaseType) {
		this.uuid = uuid;
		this.name = name;
		this.diseaseType = diseaseType;
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
	public DiseaseType getDiseaseType() {
		return diseaseType;
	}
	public void setDiseaseType(DiseaseType diseaseType) {
		this.diseaseType = diseaseType;
	}

	public String toString() {
		return "Disease [" + (uuid != null ? "uuid=" + uuid + ", " : "") + (name != null ? "name=" + name + ", " : "") + (diseaseType != null ? "diseaseType=" + diseaseType : "") + "]";
	}

}
