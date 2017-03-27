package top.chsis.model;

public class CheckRecord {
	public static final int PASS = 0;
	public static final int NOTPASS = 1;
	
	private String uuid;//审核记录的uuid，唯一标识一条审核记录
	private String newsUuid;//新闻
	private Manager checker;//审核员
	private Integer result;//审核结果:0:通过，1:未通过
	private String reason;//审核未通过的原因
	private String time;//审核的时间
	
	public CheckRecord() {}

	public CheckRecord(String uuid, String newsUuid, Manager checker, Integer result, String reason, String time) {
		super();
		this.uuid = uuid;
		this.newsUuid = newsUuid;
		this.checker = checker;
		this.result = result;
		this.reason = reason;
		this.time = time;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getNewsUuid() {
		return newsUuid;
	}

	public void setNewsUuid(String newsUuid) {
		this.newsUuid = newsUuid;
	}

	public Manager getChecker() {
		return checker;
	}

	public void setChecker(Manager checker) {
		this.checker = checker;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String toString() {
		return "CheckRecord [uuid=" + uuid + ", newsUuid=" + newsUuid + ", checker=" + checker + ", result=" + result + ", reason=" + reason + ", time=" + time + "]";
	}

}
