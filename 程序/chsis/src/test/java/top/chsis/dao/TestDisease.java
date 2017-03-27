package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.DiseaseHistory;
import top.chsis.model.Resident;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestDisease {
	@Autowired
	private DiseaseHistoryMapper diseaseHistoryMapper;
	
	@Test
	public void testSearch() {
		DiseaseHistory diseaseHistory = diseaseHistoryMapper.selectByPrimaryKey("1");
		System.out.println(diseaseHistory);
	}
	
	@Test
	public void testSelectDiseaseHistoriesByPatientUUID() {
		 List<DiseaseHistory> diseaseHistories= diseaseHistoryMapper.selectDiseaseHistoriesByPatientUUID("1");
		 System.out.println(diseaseHistories);
	}

	@Test
	public void testInsert() {
		DiseaseHistory diseaseHistory = new DiseaseHistory();
		diseaseHistory.setUuid(StringUtil.getUUID());
		diseaseHistory.setDescription("没有");
		diseaseHistory.setEndTime("2012");
		diseaseHistory.setStartTime("2013");
		diseaseHistory.setName("过敏史");
		diseaseHistory.setType(1);
		Resident patient = new Resident();
		patient.setUuid("1");
		diseaseHistory.setPatient(patient);
		diseaseHistoryMapper.insert(diseaseHistory);
		int insert = diseaseHistoryMapper.insert(diseaseHistory);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective(){
		DiseaseHistory diseaseHistory = new DiseaseHistory();
		diseaseHistory.setUuid("8");
		diseaseHistory.setEndTime("2012");
		diseaseHistory.setStartTime("2013");
		diseaseHistory.setName("过敏史");
		diseaseHistory.setType(1);
		Resident patient = new Resident();
		patient.setUuid("1");
		diseaseHistory.setPatient(patient);
		int insert = diseaseHistoryMapper.insert(diseaseHistory);
		System.out.println(insert);
	}
	@Test
	public void testUpdate() {
		DiseaseHistory diseaseHistory = diseaseHistoryMapper.selectByPrimaryKey("1");
		diseaseHistory.setName("精神科");
		diseaseHistory.setType(4);
		int update = diseaseHistoryMapper.updateByPrimaryKey(diseaseHistory);
		System.out.println(update);
		System.out.println(diseaseHistory);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		DiseaseHistory diseaseHistory = diseaseHistoryMapper.selectByPrimaryKey("1");
		diseaseHistory.setName("精神科");
		int update = diseaseHistoryMapper.updateByPrimaryKey(diseaseHistory);
		System.out.println(update);
		System.out.println(diseaseHistory);
	}
	@Test
	public void delete(){
		int delete = diseaseHistoryMapper.deleteByPrimaryKey("8");
		System.out.println(delete);
	}

}
