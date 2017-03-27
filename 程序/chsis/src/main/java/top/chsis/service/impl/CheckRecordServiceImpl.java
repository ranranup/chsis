package top.chsis.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.CheckRecordMapper;
import top.chsis.dao.NewsMapper;
import top.chsis.model.CheckRecord;
import top.chsis.model.News;
import top.chsis.service.ICheckRecordService;

@Service("checkRecordService")
public class CheckRecordServiceImpl implements ICheckRecordService {
	
	@Autowired
	private CheckRecordMapper checkRecordMapper;
	
	@Autowired
	private NewsMapper newsMapper;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public int deleteByPrimaryKey(String uuid) {
		return checkRecordMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(CheckRecord record) {
		return checkRecordMapper.insert(record);
	}

	public int insertSelective(CheckRecord record) {
		return checkRecordMapper.insertSelective(record);
	}

	public CheckRecord selectByPrimaryKey(String uuid) {
		return checkRecordMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(CheckRecord record) {
		return checkRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CheckRecord record) {
		return checkRecordMapper.updateByPrimaryKey(record);
	}

	public List<CheckRecord> selectByNewsUuid(String newsUuid) {
		return checkRecordMapper.selectByNewsUuid(newsUuid);
	}

	public int check(CheckRecord checkRecord, boolean pass) {
		checkRecordMapper.insert(checkRecord);
		News news = new News();
		news.setUuid(checkRecord.getNewsUuid());
		news.setCheckTime(checkRecord.getTime());
		news.setChecker(checkRecord.getChecker());
		if(pass) {
			news.setState(News.STATE_PASS);
			news.setPublishTime(sdf.format(new Date()));
		} else {
			news.setState(News.STATE_NOT_PASS);
		}
		
		newsMapper.updateByPrimaryKeySelective(news);
		
		return 2;
	}
	
}
