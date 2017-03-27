package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Log;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestLog {
	@Autowired
	private LogMapper logMapper;
	
	@Test
	public void testSearch() {
		Log log = logMapper.selectByPrimaryKey("1");
		System.out.println(log);
	}

	@Test
	public void testInsert() {
		Log log = new Log();
		log.setDetail("111");
		log.setOperation("1");
		log.setState(1);
		log.setTime("2016");
		log.setUserUUID("2");
		log.setUserType(1);
		log.setUuid(StringUtil.getUUID());
		int insert = logMapper.insert(log);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective(){
		Log log = new Log();
		log.setDetail("111");
		log.setOperation("1");
		log.setState(1);
		log.setTime("2016");
		log.setUserUUID("2");
		log.setUserType(1);
		log.setUuid(StringUtil.getUUID());
		int insert = logMapper.insert(log);
		System.out.println(insert);
	}
	@Test
	public void testUpdate() {
		Log log = logMapper.selectByPrimaryKey("1");
		log.setDetail("我往往会无法v比较烦一百一十一");
		log.setOperation("1");
		log.setState(1);
		log.setTime("20160212");
		log.setUserUUID("1");
		log.setUserType(0);
		int update = logMapper.updateByPrimaryKey(log);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Log log = logMapper.selectByPrimaryKey("1");
		log.setDetail("我往往会无法v比较烦一百一十一");
		log.setOperation("1");
		int update = logMapper.updateByPrimaryKey(log);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = logMapper.deleteByPrimaryKey("2b99e3f3454f4583b9a29f33b14d9bc8");
		System.out.println(delete);
	}
	
	
}
