package top.chsis.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

import top.chsis.util.DBUtil;

public class UploadObject {
	
	public static final String DOMAIN;
	public static final String DOCTOR_ACCOUNT_PHOTO_BASE_PATH;
	public static final String REPORT_BASE_PATH;
	public static final String NEWS_IMAGE;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(DBUtil.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		DOMAIN = props.getProperty("DOMAIN");
		DOCTOR_ACCOUNT_PHOTO_BASE_PATH = props.getProperty("DOCTOR_ACCOUNT_PHOTO_BASE_PATH");
		REPORT_BASE_PATH = props.getProperty("REPORT_BASE_PATH");
		NEWS_IMAGE = props.getProperty("NEWS_IMAGE");
	}
	
	private String fileName;
	private String remoteBasePath;
	private MultipartFile multipartFile;
	
	public UploadObject(String fileName, String remoteBasePath, MultipartFile multipartFile) {
		this.remoteBasePath = remoteBasePath;
		this.multipartFile = multipartFile;
		String originalFilename = multipartFile.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length()).toLowerCase();
		this.fileName = fileName + ext;
	}
	
	public String getRemotePath() {
		return remoteBasePath + fileName;
	}

	public InputStream getInputStream() throws IOException {
		return multipartFile.getInputStream();
	}

}
