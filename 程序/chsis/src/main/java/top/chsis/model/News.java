package top.chsis.model;

import java.io.Serializable;

public class News implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static final int AUTHOR_DOCTOR = 0;
	public static final int AUTHOR_HOSPITALMANAGER = 1;
	public static final int AUTHOR_SYSTEMMANAGER = 2;
	
	public static final int TYPE_DOCTOR_WORDS = 0;
	public static final int TYPE_DAILY_HEALTH = 1;
	public static final int TYPE_HOSPITAL_NOTICE = 2;
	public static final int TYPE_COMMUNITY_ANNOCEMNET = 3;
	
	public static final int STATE_CHECKING = 0;
	public static final int STATE_NOT_PASS = 1;
	public static final int STATE_PASS = 2;
	
	private String uuid;//唯一标识一条新闻，主键
	private String title;//新闻标题
	private String authorUuid;//作者
	private Integer authorType;//作者类型：0医生、1医院管理员、2系统管理员
	private String authorName;//作者姓名
	private Integer type;//类型：新闻的板块 0医生寄语、1每日健康、2医院通知、3社区公告
	private String content;//新闻内容
	private String submitTime;//提交时间
	private String checkTime;//审核时间
	private String publishTime;//发布时间
	private Integer state;//新闻的状态：0审核中、1审核未通过、2审核通过
	private Manager checker;//审核者
	private Integer click;//点击量
	
	public News() {}

	public News(String uuid, String title, String authorUuid, Integer type, String submitTime, Integer state) {
		super();
		this.uuid = uuid;
		this.title = title;
		this.authorUuid = authorUuid;
		this.type = type;
		this.submitTime = submitTime;
		this.state = state;
	}


	public News(String uuid, String title, String authorUuid, Integer authorType, String authorName, Integer type, String content, String submitTime, String checkTime, String publishTime, Integer state, Manager checker, Integer click) {
		super();
		this.uuid = uuid;
		this.title = title;
		this.authorUuid = authorUuid;
		this.authorType = authorType;
		this.authorName = authorName;
		this.type = type;
		this.content = content;
		this.submitTime = submitTime;
		this.checkTime = checkTime;
		this.publishTime = publishTime;
		this.state = state;
		this.checker = checker;
		this.click = click;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthorUuid() {
		return authorUuid;
	}

	public void setAuthorUuid(String authorUuid) {
		this.authorUuid = authorUuid;
	}

	public Integer getAuthorType() {
		return authorType;
	}

	public void setAuthorType(Integer authorType) {
		this.authorType = authorType;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Manager getChecker() {
		return checker;
	}

	public void setChecker(Manager checker) {
		this.checker = checker;
	}

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	@Override
	public String toString() {
		return "News [uuid=" + uuid + ", title=" + title + ", authorUuid=" + authorUuid + ", authorType=" + authorType + ", authorName=" + authorName + ", type=" + type + ", content=" + content + ", submitTime=" + submitTime + ", checkTime=" + checkTime + ", publishTime=" + publishTime + ", state=" + state + ", checker=" + checker + ", click=" + click + "]";
	}
	
}
