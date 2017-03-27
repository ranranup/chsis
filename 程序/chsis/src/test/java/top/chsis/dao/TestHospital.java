package top.chsis.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Hospital;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestHospital {
	
	@Autowired
	private HospitalMapper hospitalMapper;

	@Test
	public void testSearch() {
		Hospital hospital = hospitalMapper.selectByPrimaryKey("1");
		System.out.println(hospital);
	}
	
	@Test
	public void testInsert() {
		Hospital hospital = new Hospital();
		hospital.setUuid(StringUtil.getUUID());
		hospital.setName("QQQQQ徐州医院");
		hospital.setNumber("ss105");
		hospital.setDescription("QQQ坐落在徐州");
		hospital.setAddress("QQQ徐州");
		int insert = hospitalMapper.insert(hospital);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective() {
		Hospital hospital = new Hospital();
		hospital.setUuid(StringUtil.getUUID());
		hospital.setName("大徐州医院");
		hospital.setNumber("333333");
		hospital.setDescription("坐落在徐州");
		hospital.setAddress("徐州");
		int insert = hospitalMapper.insert(hospital);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		Hospital hospital = hospitalMapper.selectByPrimaryKey("b508ebb4ec7647c390258f1b0f85b0ff");
		System.out.println(hospital);
		hospital.setName("鼓楼医院");
		hospital.setNumber("YY002");
		hospital.setDescription("二级甲等综合性医院");
		hospital.setAddress("南京市栖霞区");
		int update = hospitalMapper.updateByPrimaryKey(hospital);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Hospital hospital = hospitalMapper.selectByPrimaryKey("b508ebb4ec7647c390258f1b0f85b0ff");
		System.out.println(hospital);
		hospital.setName("小鼓楼医院");
		int update = hospitalMapper.updateByPrimaryKey(hospital);
		System.out.println(update);
	}
	
	@Test
	public void testDelete() {
		hospitalMapper.deleteByPrimaryKey("fa2e143074ab4a5fbad16b5f57efcbf3");
	}

}
