package top.chsis.model;

public class Resource {
	
	private String uuid;
	
	private String name;
	
	private String url;
	
	private String description;

	public Resource() {}

	public Resource(String uuid, String name, String url, String description) {
		super();
		this.uuid = uuid;
		this.name = name;
		this.url = url;
		this.description = description;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String toString() {
		return "Resource [uuid=" + uuid + ", name=" + name + ", url=" + url + ", description=" + description + "]";
	}
	
}
