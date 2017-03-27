package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Community;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestCommunity {
	@Autowired
	private CommunityMapper communityMapper;
	
	@Test
	public void testSearch() {
		Community community = communityMapper.selectByPrimaryKey("1");
		System.out.println(community);
	}

	@Test
	public void testInsert() {
		Community community = new Community();
		community.setUuid(StringUtil.getUUID());
		community.setAddress("杭州");
		community.setDescription("承潞在杭州");
		community.setName("阳光社区");
		community.setNumber("122423432");
		communityMapper.insert(community);
		System.out.println(community);
	}
	
	@Test
	public void testInsertSelective(){
		Community community = new Community();
		community.setUuid(StringUtil.getUUID());
		community.setName("阳光社区2期");
		community.setNumber("888888");
		communityMapper.insert(community);
		System.out.println(community);
	}
	@Test
	public void testUpdate() {
		Community community = communityMapper.selectByPrimaryKey("1");
		community.setName("冉冉社区");
		int update = communityMapper.updateByPrimaryKey(community);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Community community = communityMapper.selectByPrimaryKey("1");
		community.setName("AAA冉冉社区");
		int update = communityMapper.updateByPrimaryKey(community);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = communityMapper.deleteByPrimaryKey("9fa6a5e0c5c14ab59aac0d1e05cf7ff1");
		System.out.println(delete);
	}
	
	
}
