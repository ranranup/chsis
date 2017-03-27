package top.chsis.model;

import java.io.Serializable;

public class Resident implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String uuid;//唯一标识一个居民，主键
	private String userName;//用户名
	private String password;//密码
	private String name;//姓名	
	private Integer sex;//性别：0男、1女
	private String idNo;//身份证号
	private String nation;//民族
	private String birth;//出生日期
	private Integer age;//年龄
	private Integer period;//年龄段：0婴幼儿、1儿童、2青少年、3青年、4中年、5中老年、6老年
	private String phone;//电话
	private Integer marriage;//婚姻状况:0未婚、1已婚、2离异
	private String height;//身高
	private String weight;//体重
	private String eyesight;//视力：<左眼 右眼>
	private Integer bloodType;//血型：0A、1B、2AB、3O
	private Family family;//家庭
	
	public Resident() {
		super();
	}

	public Resident(String uuid, String userName, String password, String name, Integer sex, String idNo, String nation, String birth, Integer age, Integer period, String phone, Integer marriage, String height, String weight, String eyesight, Integer bloodType, Family family) {
		super();
		this.uuid = uuid;
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.idNo = idNo;
		this.nation = nation;
		this.birth = birth;
		this.age = age;
		this.period = period;
		this.phone = phone;
		this.marriage = marriage;
		this.height = height;
		this.weight = weight;
		this.eyesight = eyesight;
		this.bloodType = bloodType;
		this.family = family;
	}

	public Resident(String uuid) {
		this.uuid = uuid;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getPeriod() {
		return period;
	}

	public void setPeriod(Integer period) {
		this.period = period;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getMarriage() {
		return marriage;
	}

	public void setMarriage(Integer marriage) {
		this.marriage = marriage;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getEyesight() {
		return eyesight;
	}

	public void setEyesight(String eyesight) {
		this.eyesight = eyesight;
	}

	public Integer getBloodType() {
		return bloodType;
	}

	public void setBloodType(Integer bloodType) {
		this.bloodType = bloodType;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	@Override
	public String toString() {
		return "Resident [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", name=" + name + ", sex=" + sex + ", idNo=" + idNo + ", nation=" + nation + ", birth=" + birth + ", age=" + age + ", period=" + period + ", phone=" + phone + ", marriage=" + marriage + ", height=" + height + ", weight=" + weight + ", eyesight=" + eyesight + ", bloodType=" + bloodType + ", family=" + family + "]";
	}
	
}