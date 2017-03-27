package top.chsis.util;

import java.util.UUID;

public class StringUtil {
	
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static boolean isNoE(String str) {
		if(str == null || str.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getUUID());
	}

}
