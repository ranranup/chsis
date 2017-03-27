package top.chsis.service;

import java.util.List;

import top.chsis.model.CheckRecord;

public interface ICheckRecordService {
	int deleteByPrimaryKey(String uuid);

    int insert(CheckRecord record);

    int insertSelective(CheckRecord record);

    CheckRecord selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(CheckRecord record);

    int updateByPrimaryKey(CheckRecord record);

    List<CheckRecord> selectByNewsUuid(String newsUuid);

	int check(CheckRecord checkRecord, boolean pass);
}
