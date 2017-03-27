package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Manager;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestManager {
	@Autowired
	private ManagerMapper managerMapper;
	
	@Test
	public void testSearch() {
		Manager manager = managerMapper.selectByPrimaryKey("1");
		System.out.println(manager);
	}

	@Test
	public void testInsert() {
		Manager manager = new Manager();
		manager.setUuid(StringUtil.getUUID());
		manager.setName("管理员");
		manager.setPassword("121314");
		manager.setPhone("12323938293");
		manager.setType(1);
		manager.setUserName("manager");
		int insert = managerMapper.insert(manager);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective(){
		Manager manager = new Manager();
		manager.setUuid(StringUtil.getUUID());
		manager.setName("内容管理员");
		manager.setPassword("121314");
		manager.setPhone("12323938293");
		manager.setType(1);
		manager.setUserName("manager");
		int insert = managerMapper.insert(manager);
		System.out.println(insert);
	}
	@Test
	public void testUpdate() {
		Manager manager = managerMapper.selectByPrimaryKey("1");
		manager.setName("系统管理员");
		manager.setPassword("2222222");
		manager.setPhone("2222222222");
		manager.setType(2);
		manager.setUserName("manager2");
		int update = managerMapper.updateByPrimaryKey(manager);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Manager manager = managerMapper.selectByPrimaryKey("1");
		manager.setName("系统管理员");
		manager.setUserName("2manager");
		int update = managerMapper.updateByPrimaryKey(manager);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = managerMapper.deleteByPrimaryKey("9776d26b6d9f4373b4f7e4206d36b6af");
		System.out.println(delete);
	}
	
	
}
