package top.chsis.util;

import org.junit.Test;

import com.alibaba.fastjson.JSONObject;


public class TestJson {


	@Test
	public void test() {
		String s = "{'code':0,'message':'成功','data':{'access_url':'http://bishe-10034293.file.myqcloud.com/chsis/doctor/1.png','resource_path':'/chsis/doctor/1.png','source_url':'http://bishe-10034293.cos.myqcloud.com/chsis/doctor/1.png','url':'http://web.file.myqcloud.com/files/v1/chsis/doctor/1.png'}}";
		JSONObject object = JSONObject.parseObject(s);
		object.remove("data");
		System.out.println(object);
		
	}

}
