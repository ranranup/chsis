package top.chsis.service;

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
public class TestCheckReportService {
	@Autowired
	private ICheckReportService checkReportService;
	
	@Test
	public void testDelete() {
		int delete = checkReportService.deleteByPrimaryKey("aa9248687d4c435098ef8f626743dcb2");
		System.err.println(delete);
	}
	
	@Test
	public void testSearch(){
		CheckReport checkReport = checkReportService.selectByPrimaryKey("1");
		System.out.println(checkReport);
	}
	@Test
	public void testSelectCheckReportsByHospitalUUID() {
		List<CheckReport> checkReports = checkReportService.selectCheckReportsByHospitalUUID("1");
		System.out.println(checkReports);
	}
	@Test
	public void testInsert() {
		CheckReport checkReport = new CheckReport();
		checkReport.setUuid(StringUtil.getUUID());
		checkReport.setDescription("pppppp就诊报告");
		Hospital hospital = new Hospital();
		hospital.setUuid("1");
		checkReport.setHospital(hospital);
		checkReport.setName("pppppp就诊报告");
		
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
		//int insert = checkReportService.insert(checkReport);
		//System.out.println(insert);
	}
}
