package top.chsis.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import top.chsis.util.UploadUtil;

@Controller
@RequestMapping("/image")
public class ImageController {

	@RequestMapping("/doctorImage")
	@ResponseBody
	public Map<String, Object> doctorImage(HttpServletRequest request, HttpSession session) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile imgFile = multipartRequest.getFile("file_data");
		InputStream inputStream = null;
		try {
			inputStream = imgFile.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//拿到类型
		String fileName = imgFile.getOriginalFilename();
		// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		// 对扩展名进行小写转换
		ext = ext.toLowerCase();
		String remotePath = "/chsis/doctor/1." +  ext;
		String uploadImage = null;
		try {
			uploadImage = UploadUtil.uploadImage(remotePath, inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.parseObject(uploadImage);
		json.remove("data");
		return json;
	}
	
}
