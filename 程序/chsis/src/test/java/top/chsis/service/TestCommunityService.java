package top.chsis.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Community;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestCommunityService {
	@Autowired
	private ICommunityService communityService;
	
	@Test
	public void testSearch() {
		Community community = communityService.selectByPrimaryKey("1");
		System.out.println(community);
	}

	@Test
	public void testInsert() {
		Community community = new Community();
		community.setUuid(StringUtil.getUUID());
		community.setAddress("dddddd杭州");
		community.setDescription("dddd承潞在杭州");
		community.setName("ddddd阳光社区");
		community.setNumber("122423432");
		communityService.insert(community);
		System.out.println(community);
	}
	
	@Test
	public void testInsertSelective(){
		Community community = new Community();
		community.setUuid(StringUtil.getUUID());
		community.setName("阳光社区2期");
		community.setNumber("888888");
		communityService.insert(community);
		System.out.println(community);
	}
	@Test
	public void testUpdate() {
		Community community = communityService.selectByPrimaryKey("317e9b0de5d744e484b7ede05641c9db");
		community.setName("冉冉社区");
		int update = communityService.updateByPrimaryKey(community);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Community community = communityService.selectByPrimaryKey("1");
		community.setName("AAA冉冉社区");
		int update = communityService.updateByPrimaryKey(community);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = communityService.deleteByPrimaryKey("9fa6a5e0c5c14ab59aac0d1e05cf7ff1");
		System.out.println(delete);
	}
	
	
}
