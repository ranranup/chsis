package top.chsis.vo;

public class PiePair {
	
	private String name;
	
	private Integer value;

	public PiePair() {}

	public PiePair(String name, Integer value) {
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String toString() {
		return "PiePair [" + (name != null ? "name=" + name + ", " : "") + (value != null ? "value=" + value : "") + "]";
	}
	
}
