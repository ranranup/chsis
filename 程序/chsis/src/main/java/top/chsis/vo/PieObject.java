package top.chsis.vo;

import java.util.Arrays;
import java.util.List;

public class PieObject {

	private String[] diseaseNames;
	
	private List<PiePair> piePairs;

	public PieObject() {}

	public PieObject(String[] diseaseNames, List<PiePair> piePairs) {
		this.diseaseNames = diseaseNames;
		this.piePairs = piePairs;
	}

	public String[] getDiseaseNames() {
		return diseaseNames;
	}

	public void setDiseaseNames(String[] diseaseNames) {
		this.diseaseNames = diseaseNames;
	}

	public List<PiePair> getPiePairs() {
		return piePairs;
	}

	public void setPiePairs(List<PiePair> piePairs) {
		this.piePairs = piePairs;
	}

	public String toString() {
		return "PieObject [" + (diseaseNames != null ? "diseaseNames=" + Arrays.toString(diseaseNames) + ", " : "") + (piePairs != null ? "piePairs=" + piePairs : "") + "]";
	}
}
