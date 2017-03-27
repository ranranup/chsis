package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.CheckReport;
import top.chsis.model.UploadObject;

public interface ICheckReportService {
	int deleteByPrimaryKey(String uuid);

    int insert(CheckReport record, UploadObject uo) throws Exception;
    
    int insert(CheckReport record);

    int insertSelective(CheckReport record);

    CheckReport selectByPrimaryKey(String uuid);
    
    List<CheckReport> selectCheckReportsByPatientUUID(String patientUUID);

    List<CheckReport> selectCheckReportsByHospitalUUID(String hospitalUUID);

    List<CheckReport> selectCheckReportsByMedicalRecordUUID(String medicalrecordUUID);
    
    int updateByPrimaryKeySelective(CheckReport record, UploadObject uo) throws Exception;

    int updateByPrimaryKey(CheckReport record);

	PageInfo<CheckReport> selectByConditionAndPagingInResident(CheckReport checkReport, int page, int size);
}
