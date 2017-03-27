package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Department;
import top.chsis.model.Doctor;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestDoctor {
	
	@Autowired
	private DoctorMapper doctorMapper;

	@Test
	public void testSearch() {
		Doctor doctor = doctorMapper.selectByPrimaryKey("1");
		System.out.println(doctor);
	}
	
	@Test
	public void testInsert() {
		Department department = new Department();
		department.setUuid("1");
		String uuid = StringUtil.getUUID();
		Doctor doctor = new Doctor(uuid, "li", "123","22222", "李医生", "d:/33.jpg",1, "122111", 2, "好医生", 2, department);
	    int insert = doctorMapper.insert(doctor);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective() {
		Department department = new Department();
		department.setUuid("1");
		String uuid = StringUtil.getUUID();
		Doctor doctor = new Doctor();
		doctor.setUuid(uuid);
		doctor.setDepartment(department);
		doctor.setName("22222");
		doctor.setNumber("22222");
		doctor.setPassword("22222");
		doctor.setPhone("22222");
		doctor.setPhoto("222");
		doctor.setSex(1);
		doctor.setTitle(1);
		doctor.setUserName("22222");
		doctor.setUuid(StringUtil.getUUID());
	    int insert = doctorMapper.insert(doctor);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		Doctor doctor = doctorMapper.selectByPrimaryKey("1");
		System.out.println(doctor);
		doctor.setName("77777医院");
		Department department = new Department();
		department.setUuid("730cf6c58d6b40b19627dd6258e3bba8");
		doctor.setDepartment(department);
		doctor.setNumber("YY002");
		doctor.setDescription("二级甲等综合性医院");
		int update = doctorMapper.updateByPrimaryKey(doctor);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Doctor doctor = doctorMapper.selectByPrimaryKey("1");
		System.out.println(doctor);
		doctor.setName("77777医院");
		doctor.setNumber("YY002");
		doctor.setDescription("二级甲等综合性医院");
		int update = doctorMapper.updateByPrimaryKey(doctor);
		System.out.println(update);
	}
	
	@Test
	public void testDelete() {
		int delete = doctorMapper.deleteByPrimaryKey("b7c9107ff1244dafa1a3a77bfc6f2f52");
		System.out.println(delete);
	}
	@Test
	public void testSelectDoctorsByDepartmentUUID() {
		List<Doctor> doctors = doctorMapper.selectDoctorsByDepartmentUUID("1");
		System.err.println(doctors);
	}
}
