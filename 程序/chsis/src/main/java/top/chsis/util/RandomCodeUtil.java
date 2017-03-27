package top.chsis.util;

public class RandomCodeUtil {
	
	public static String numberFour() {
		return String.valueOf((int)Math.round(Math.random()*8999+1000));
	}
	
	public static String numberSix() {
		return String.valueOf((int)Math.round(Math.random()*899999+100000));
	}
	
}