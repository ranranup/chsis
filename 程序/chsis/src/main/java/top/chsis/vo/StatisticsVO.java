package top.chsis.vo;

import java.util.List;

public class StatisticsVO {
	
	private String diseaseUuid;
	
	private String year;
	
	private String period;
	
	private List<String> diseaseUuids;
	
	
	public StatisticsVO() {}

	public StatisticsVO(String diseaseUuid, String year, String period, List<String> diseaseUuids) {
		this.diseaseUuid = diseaseUuid;
		this.year = year;
		this.period = period;
		this.diseaseUuids = diseaseUuids;
	}

	public String getDiseaseUuid() {
		return diseaseUuid;
	}

	public void setDiseaseUuid(String diseaseUuid) {
		this.diseaseUuid = diseaseUuid;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public List<String> getDiseaseUuids() {
		return diseaseUuids;
	}

	public void setDiseaseUuids(List<String> diseaseUuids) {
		this.diseaseUuids = diseaseUuids;
	}

	@Override
	public String toString() {
		return "StatisticsVO [" + (diseaseUuid != null ? "diseaseUuid=" + diseaseUuid + ", " : "") + (year != null ? "year=" + year + ", " : "") + (period != null ? "period=" + period + ", " : "") + (diseaseUuids != null ? "diseaseUuids=" + diseaseUuids : "") + "]";
	}

}
