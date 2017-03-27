package top.chsis.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.chsis.model.Hospital;
import top.chsis.model.ImmuneRecord;
import top.chsis.model.Resident;
import top.chsis.util.StringUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class TestImmuneRecord {
	@Autowired
	private ImmuneRecordMapper immuneRecordMapper;
	
	@Test
	public void testSearch() {
		ImmuneRecord immuneRecord = immuneRecordMapper.selectByPrimaryKey("1");
		System.out.println(immuneRecord);
	}
	@Test
	public void testSelectImmuneRecordsByPatientUUID() {
		List<ImmuneRecord> immuneRecords = immuneRecordMapper.selectImmuneRecordsByPatientUUID("1");
		System.out.println(immuneRecords);
	}
	@Test
	public void testSelectImmuneRecordsByHospitalUUID() {
		List<ImmuneRecord> immuneRecords = immuneRecordMapper.selectImmuneRecordsByHospitalUUID("1");
		System.out.println(immuneRecords);
	}

	@Test
	public void testInsert() {
		ImmuneRecord immuneRecord = new ImmuneRecord();
		immuneRecord.setUuid(StringUtil.getUUID());
		Hospital hospital = new Hospital();
		hospital.setUuid("2");
		immuneRecord.setHospital(hospital);
		immuneRecord.setImmuneTime("2012");
		Resident patient = new Resident();
		patient.setUuid("1");
		immuneRecord.setPatient(patient);
		immuneRecord.setVaccine("1");
		int insert = immuneRecordMapper.insert(immuneRecord);
		System.out.println(insert);
	}
	@Test
	public void testInsertSelective() {
		ImmuneRecord immuneRecord = new ImmuneRecord();
		immuneRecord.setUuid(StringUtil.getUUID());
		Hospital hospital = new Hospital();
		hospital.setUuid("2");
		immuneRecord.setHospital(hospital);
		immuneRecord.setImmuneTime("2012");
		Resident patient = new Resident();
		patient.setUuid("1");
		immuneRecord.setPatient(patient);
		immuneRecord.setVaccine("1");
		int insert = immuneRecordMapper.insert(immuneRecord);
		System.out.println(insert);
	}
	
	@Test
	public void testUpdate() {
		ImmuneRecord immuneRecord = immuneRecordMapper.selectByPrimaryKey("1");
		Hospital hospital = new Hospital();
		hospital.setUuid("2");
		immuneRecord.setHospital(hospital);
		immuneRecord.setImmuneTime("2222");
		Resident patient = new Resident();
		patient.setUuid("2");
		immuneRecord.setPatient(patient);
		immuneRecord.setVaccine("2");
		int update = immuneRecordMapper.updateByPrimaryKey(immuneRecord);
		System.out.println(update);
	}
	
	@Test
	public void testUpdateByPrimaryKeySelective() {
		ImmuneRecord immuneRecord = immuneRecordMapper.selectByPrimaryKey("1");
		immuneRecord.setImmuneTime("11111");
		Resident patient = new Resident();
		patient.setUuid("1");
		immuneRecord.setPatient(patient);
		immuneRecord.setVaccine("1");
		int update = immuneRecordMapper.updateByPrimaryKey(immuneRecord);
		System.out.println(update);
	}
	
	@Test
	public void testDelete(){
		int delete = immuneRecordMapper.deleteByPrimaryKey("88cbb24e46af4f888a0a5bf20d3a41fc");
		System.out.println(delete);
	}
	
}
