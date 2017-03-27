package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.News;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestNews {
	
	@Autowired
	private NewsMapper newsMapper;
		
	@Test
	public void testSearch() {
		News news = newsMapper.selectByPrimaryKey("1");
		System.out.println(news);
	}
	
	@Test
	public void testInsert() {
		News news = new News();

		news.setUuid(StringUtil.getUUID());
		news.setTitle("外科新闻");
		news.setCheckTime("2016.03.16");
		news.setSubmitTime("2016.03.15");
		news.setContent("坚实的房间开");
		news.setPublishTime("20150318");
		news.setState(2);
		news.setType(2);
		
		int insert = newsMapper.insert(news);
		System.out.println(insert);
	}
	@Test
	public void testInsertSelective() {
		News news = new News();
		
		news.setUuid(StringUtil.getUUID());
		news.setTitle("外科新闻");
		news.setCheckTime("2016.03.16");
		news.setSubmitTime("2016.03.15");
		news.setContent("坚实的房间开");
		news.setPublishTime("20150318");
		news.setState(2);
		news.setType(2);
		
		int insert = newsMapper.insert(news);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		News news = newsMapper.selectByPrimaryKey("1");
		news.setCheckTime("2015.5");
		news.setSubmitTime("2015.4");
		news.setContent("么有大事");
		news.setPublishTime("2015.6");
		news.setState(1);
		news.setTitle("妇产科");
		int update = newsMapper.updateByPrimaryKey(news);
		System.out.println(update);
	}
	@Test
	public void testupdateByPrimaryKeySelective() {
		News news = newsMapper.selectByPrimaryKey("967ca9c416ee4c16ba9f473a18b8210e");
		news.setCheckTime("2015.5");
		news.setSubmitTime("2015.4");
		news.setContent("么有大事");
		news.setPublishTime("2015.6");
		news.setState(1);
		news.setTitle("妇产科");
		int update = newsMapper.updateByPrimaryKey(news);
		System.out.println(update);
	}
	@Test
	public void testDelete() {
		int delete = newsMapper.deleteByPrimaryKey("e8ae1b90d48843e9bcc11261c3fe8b1a");
		System.out.println(delete);
	}

}
