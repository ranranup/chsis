package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Family;
import top.chsis.model.Resident;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestResident {
	
	@Autowired
	private ResidentMapper residentMapper;
		
	@Test
	public void testSearch() {
		Resident resident = residentMapper.selectByPrimaryKey("1");
		System.out.println(resident);
	}
	@Test
	public void testSelectResidentsByFamilyUUID() {
		List<Resident> residents = residentMapper.selectResidentsByFamilyUUID("1");
		System.out.println(residents);
	}
	
	@Test
	public void testInsert() {
		Family family = new Family();
		family.setUuid("1");
		Resident resident = new Resident(StringUtil.getUUID(), "王豫宁", "11111", "王豫宁", 1, "32921212", "汉", "2012", 21, 4, "2121", 1, "182", "122", "1.0,1.2", 2, family);
		int insert = residentMapper.insert(resident);
		System.out.println(insert);
	}
	@Test
	public void testInsertSelective() {
		Family family = new Family();
		family.setUuid("1");
		Resident resident = new Resident();
		resident.setAge(21);
		resident.setBirth("19931210");
		resident.setFamily(family);
		resident.setIdNo("32323232");
		resident.setMarriage(1);
		resident.setName("zhangsan");
		resident.setPassword("12121");
		resident.setPeriod(3);
		resident.setPhone("2882912");
		resident.setSex(1);
		resident.setUserName("121212");
		resident.setUuid("6");
		int insert = residentMapper.insert(resident);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		Resident resident = residentMapper.selectByPrimaryKey("6");
		Family family = new Family();
		family.setUuid("1");
		resident.setAge(21);
		resident.setBirth("333333");
		resident.setFamily(family);
		resident.setIdNo("333333");
		resident.setMarriage(1);
		resident.setName("33333");
		resident.setPassword("33333");
		resident.setPeriod(3);
		resident.setPhone("3");
		resident.setSex(1);
		resident.setNation("汉");
		resident.setWeight("64kg");
		resident.setHeight("183cm");
		resident.setEyesight("1,2");
		resident.setBloodType(2);
		resident.setUserName("3333");
		int update = residentMapper.updateByPrimaryKey(resident);
		System.out.println(update);
	}
	@Test
	public void testupdateByPrimaryKeySelective() {
		Resident resident = residentMapper.selectByPrimaryKey("2462a5c3ef7743aea24df487da02dd7f");
		Family family = new Family();
		family.setUuid("1");
		resident.setAge(21);
		resident.setBirth("333333");
		resident.setFamily(family);
		resident.setIdNo("333333");
		resident.setMarriage(1);
		resident.setName("33333");
		resident.setPassword("33333");
		resident.setPeriod(3);
		int update = residentMapper.updateByPrimaryKey(resident);
		System.out.println(update);
	}
	@Test
	public void testDelete() {
		int delete = residentMapper.deleteByPrimaryKey("2");
		System.out.println(delete);
	}

}
