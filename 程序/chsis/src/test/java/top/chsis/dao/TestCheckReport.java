package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.CheckReport;
import top.chsis.model.Family;
import top.chsis.model.Hospital;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Resident;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestCheckReport {
	@Autowired
	private CheckReportMapper checkReportMapper;
	
	@Test
	public void testSearch() {
		CheckReport checkReport = checkReportMapper.selectByPrimaryKey("1");
		System.out.println(checkReport);
	}
	@Test
	public void testSelectCheckReportsByPatientUUID() {
		List<CheckReport> checkReports = checkReportMapper.selectCheckReportsByPatientUUID("1");
		System.out.println(checkReports);
	}
	@Test
	public void testSelectCheckReportsByHospitalUUID() {
		List<CheckReport> checkReports = checkReportMapper.selectCheckReportsByHospitalUUID("1");
		System.out.println(checkReports);
	}
	@Test
	public void testSelectCheckReportsByMedicalRecordUUID() {
		List<CheckReport> checkReports = checkReportMapper.selectCheckReportsByMedicalRecordUUID("1");
		System.out.println(checkReports);
	}
	@Test
	public void testInsert() {
		CheckReport checkReport = new CheckReport();
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setDescription("qqqqqqq就诊报告");
		Hospital hospital = new Hospital();
		hospital.setUuid("1");
		checkReport.setHospital(hospital);
		checkReport.setName("就诊报告");
		
		Resident patient = new Resident();
		patient.setUuid("2");
		patient.setAge(21);
		patient.setBirth("12121");
		patient.setBloodType(2);
		patient.setEyesight("1,2");
		patient.setFamily(new Family());
		patient.setIdNo("212132423435");
		patient.setMarriage(1);
		patient.setPassword("212dsd");
		patient.setPeriod(32);
		patient.setPhone("13124243234");
		patient.setSex(1);
		patient.setWeight("21");
		
		checkReport.setPatient(patient);
		checkReport.setState(1);
		checkReport.setTime("20161111");
		checkReport.setUrl("21");
		
		MedicalRecord medicalRecord = new MedicalRecord();
		medicalRecord.setUuid("1");
		checkReport.setMedicalRecord(medicalRecord);
		int insert = checkReportMapper.insert(checkReport);
		System.out.println(insert);
	}
	
	@Test
	public void testInsertSelective(){
		CheckReport checkReport = new CheckReport();
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setDescription("wwwww就诊报告");
		Hospital hospital = new Hospital();
		hospital.setUuid("1");
		checkReport.setHospital(hospital);
		checkReport.setName("就诊报告");
		
		Resident patient = new Resident();
		patient.setUuid("2");
		patient.setAge(21);
		patient.setBirth("12121");
		patient.setBloodType(2);
		patient.setEyesight("1,2");
		patient.setFamily(new Family());
		patient.setIdNo("212132423435");
		patient.setMarriage(1);
		patient.setPassword("212dsd");
		patient.setPeriod(32);
		patient.setPhone("13124243234");
		patient.setSex(1);
		patient.setWeight("21");
		
		checkReport.setPatient(patient);
		checkReport.setState(1);
		checkReport.setTime("20161111");
		checkReport.setUrl("21");
		
		MedicalRecord medicalRecord = new MedicalRecord();
		medicalRecord.setUuid("1");
		checkReport.setMedicalRecord(medicalRecord);
		int insert = checkReportMapper.insert(checkReport);
		System.out.println(insert);
	}
	@Test
	public void testUpdate() {
		CheckReport checkReport = checkReportMapper.selectByPrimaryKey("1");
		checkReport.setName("ww冉冉");
		int update = checkReportMapper.updateByPrimaryKey(checkReport);
		System.out.println(update);
	}
	@Test
	public void testUpdateByPrimaryKeySelective() {
		CheckReport checkReport = checkReportMapper.selectByPrimaryKey("1");
		checkReport.setName("123冉冉123");
		int update = checkReportMapper.updateByPrimaryKeySelective(checkReport);
		System.out.println(update);
	}
	
	@Test
	public void delete(){
		int delete = checkReportMapper.deleteByPrimaryKey("1");
		System.out.println(delete);
	}


}
