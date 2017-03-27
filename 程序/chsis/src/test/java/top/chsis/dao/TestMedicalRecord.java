package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Doctor;
import top.chsis.model.MedicalRecord;
import top.chsis.model.Resident;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestMedicalRecord {
	@Autowired
	private MedicalRecordMapper medicalRecordMapper;
	
	@Test
	public void testSearch() {
		MedicalRecord medicalRecord = medicalRecordMapper.selectByPrimaryKey("1");
		System.out.println(medicalRecord);
	}
	@Test
	public void testSelectMedicalRecordsByPatientUUID() {
		List<MedicalRecord> medicalRecords = medicalRecordMapper.selectMedicalRecordsByPatientUUID("1");
		System.out.println(medicalRecords);
	}
	@Test
	public void testSelectMedicalRecordsByHospitalUUID() {
		List<MedicalRecord> medicalRecords = medicalRecordMapper.selectMedicalRecordsByDoctorUUID("1");
		System.out.println(medicalRecords);
	}

	@Test
	public void testInsert() {
		MedicalRecord medicalRecord = new MedicalRecord();
		Doctor doctor = new Doctor();
		doctor.setUuid("2");
		medicalRecord.setDoctor(doctor);
		Resident patient = new Resident();
		patient.setUuid("1");
		medicalRecord.setPatient(patient);
		medicalRecord.setResult("无");
		medicalRecord.setState(2);
		medicalRecord.setTime("2014");
		medicalRecord.setUuid(StringUtil.getUUID());
		int insert = medicalRecordMapper.insert(medicalRecord);
		System.out.println(insert);
	}
	@Test
	public void testInsertSelective() {
		MedicalRecord medicalRecord = new MedicalRecord();
		Doctor doctor = new Doctor();
		doctor.setUuid("2");
		medicalRecord.setDoctor(doctor);
		Resident patient = new Resident();
		patient.setUuid("1");
		medicalRecord.setPatient(patient);
		medicalRecord.setResult("无");
		medicalRecord.setState(2);
		medicalRecord.setTime("2014");
		medicalRecord.setUuid(StringUtil.getUUID());
		int insert = medicalRecordMapper.insert(medicalRecord);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		MedicalRecord medicalRecord = medicalRecordMapper.selectByPrimaryKey("1");
		Doctor doctor = new Doctor();
		doctor.setUuid("2");
		medicalRecord.setDoctor(doctor);
		Resident patient = new Resident();
		patient.setUuid("1");
		medicalRecord.setPatient(patient);
		medicalRecord.setResult("无");
		medicalRecord.setState(2);
		medicalRecord.setTime("2014");
		int update = medicalRecordMapper.updateByPrimaryKey(medicalRecord);
		System.out.println(update);
	}
	
	@Test
	public void testUpdateByPrimaryKeySelective() {
		MedicalRecord medicalRecord = medicalRecordMapper.selectByPrimaryKey("745127948a834ec7b520b9fb56551a0a");
		medicalRecord.setResult("没有");
		medicalRecord.setState(2);
		medicalRecord.setTime("2016");
		int update = medicalRecordMapper.updateByPrimaryKey(medicalRecord);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = medicalRecordMapper.deleteByPrimaryKey("3");
		System.out.println(delete);
	}
	
}
