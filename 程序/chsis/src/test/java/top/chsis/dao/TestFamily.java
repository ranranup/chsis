package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Community;
import top.chsis.model.Family;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestFamily {
	@Autowired
	private FamilyMapper familyMapper;
	
	@Test
	public void testSearch() {
		Family family = familyMapper.selectByPrimaryKey("1");
		System.out.println(family);
	}
	@Test
	public void testSelectFamiliesByCommunityUUID() {
		List<Family> families = familyMapper.selectFamiliesByCommunityUUID("1");
		System.out.println(families);
	}

	@Test
	public void testInsert() {
		Family family = new Family();
		family.setUuid(StringUtil.getUUID());
		family.setAddress("peixian");
		Community community = new Community();
		community.setUuid("1");
		family.setCommunity(community);
		family.setHouseholderUUID("1");
		family.setNumber("11111");
		family.setPhone("11111");
		int insert = familyMapper.insert(family);
		System.out.println(insert);
	}
	@Test
	public void testInsertSelective(){
		Family family = new Family();
		family.setUuid(StringUtil.getUUID());
		Community community = new Community();
		community.setUuid("1");
		family.setCommunity(community);
		family.setHouseholderUUID("1");
		family.setNumber("11111");
		int insert = familyMapper.insert(family);
		System.out.println(insert);
	}
	
	
	@Test
	public void testUpdate() {
		Family family = familyMapper.selectByPrimaryKey("f2c3d80e6ad44bbcb3627451375a1327");
		family.setPhone("123456");
		family.setAddress("xuzhou");
		Community community = new Community();
		community.setUuid("3f8179278c3a40399d2613b172a18882");
		family.setCommunity(community);
		family.setHouseholderUUID("2");
		int update = familyMapper.updateByPrimaryKey(family);
		System.out.println(update);
	}
	
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Family family = familyMapper.selectByPrimaryKey("1");
		family.setPhone("123456");
		family.setHouseholderUUID("2");
		int update = familyMapper.updateByPrimaryKey(family);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = familyMapper.deleteByPrimaryKey("78494c7ea8fc4098bffa7bc95673fcdc");
		System.out.println(delete);
	}
	
}
