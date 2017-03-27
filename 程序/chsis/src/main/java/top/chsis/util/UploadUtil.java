package top.chsis.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.qcloud.cosapi.api.CosCloud;

public class UploadUtil {
	
	private static final int APP_ID;
	private static final String SECRET_ID;
	private static final String SECRET_KEY;
	private static final String BUCKET_NAME;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(DBUtil.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("读取config.properties文件出错");
		}
		
		APP_ID = Integer.parseInt(props.getProperty("APP_ID"));
		SECRET_ID = props.getProperty("SECRET_ID");
		SECRET_KEY = props.getProperty("SECRET_KEY");
		BUCKET_NAME =  props.getProperty("BUCKET_NAME");
	}
	
	
	public static String uploadImage(String remotePath, InputStream inputStream) throws Exception {
		CosCloud cos = new CosCloud(APP_ID, SECRET_ID, SECRET_KEY);
		String result = cos.uploadFile(BUCKET_NAME, remotePath, inputStream);
		return result;
	}

}
