package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Department;
import top.chsis.model.Hospital;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestDepartment {
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Test
	public void testSearch() {
		Department department = departmentMapper.selectByPrimaryKey("c701c667ca8140c792fa776a68c57969");
		System.out.println(department);
	}
	
	@Test
	public void testSelectDepartmentsByHospitalUUID() {
		List<Department> departments = departmentMapper.selectDepartmentsByHospitalUUID("1");
		System.out.println(departments);
	}

	@Test
	public void testInsert() {
		Department department = new Department();
		department.setUuid(StringUtil.getUUID());
		department.setDescription("外科");
		department.setName("外科");
		Hospital hospital = new Hospital();
		hospital.setUuid(StringUtil.getUUID());
		hospital.setName("社区医院");
		hospital.setNumber("88888");
		hospital.setAddress("沛县");
		hospital.setDescription("好地方");
		department.setNumber("124345");
		department.setHospital(hospital);
		departmentMapper.insert(department);
		System.out.println(department);
	}
	
	@Test
	public void testInsertSelective(){
		Department department = new Department();
		department.setUuid(StringUtil.getUUID());
		department.setDescription("儿科");
		department.setName("儿科");
		Hospital hospital = new Hospital();
		hospital.setUuid(StringUtil.getUUID());
		hospital.setName("社区医院");
		department.setNumber("124345");
		department.setHospital(hospital);
		departmentMapper.insert(department);
		System.out.println(department);
	}
	@Test
	public void testUpdate() {
		Department department = departmentMapper.selectByPrimaryKey("c701c667ca8140c792fa776a68c57969");
		department.setName("精神科");
		int update = departmentMapper.updateByPrimaryKey(department);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		Department department = departmentMapper.selectByPrimaryKey("1");
		System.err.println(department);
		department.setName("精神科");
		int update = departmentMapper.updateByPrimaryKey(department);
		System.out.println(update);
	}
	@Test
	public void delete(){
		int delete = departmentMapper.deleteByPrimaryKey("3482cfba4f924b1abbce535580e70beb");
		System.out.println(delete);
	}

}
