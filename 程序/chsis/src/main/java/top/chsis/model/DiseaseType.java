package top.chsis.model;

public class DiseaseType {
	
	public static final int NOT_FINAL_TYPE = 0;
	public static final int FINAL_TYPE = 1;
	
	private String uuid;
	private String name;//疾病类型名称
	private Integer level; //类型级别
	private String parentTypeUuid;//父类型
	private Integer last;//是否是最终类型
	
	public DiseaseType() {}

	public DiseaseType(String uuid, String name, Integer level, String parentTypeUuid, Integer last) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.level = level;
		this.parentTypeUuid = parentTypeUuid;
		this.last = last;
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

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getParentTypeUuid() {
		return parentTypeUuid;
	}

	public void setParentTypeUuid(String parentTypeUuid) {
		this.parentTypeUuid = parentTypeUuid;
	}

	public Integer getLast() {
		return last;
	}

	public void setLast(Integer last) {
		this.last = last;
	}

	public String toString() {
		return "DiseaseType [" + (uuid != null ? "uuid=" + uuid + ", " : "") + (name != null ? "name=" + name + ", " : "") + (level != null ? "level=" + level + ", " : "") + (parentTypeUuid != null ? "parentTypeUuid=" + parentTypeUuid + ", " : "") + (last != null ? "last=" + last : "") + "]";
	}
}
