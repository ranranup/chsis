package top.chsis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.chsis.dao.LogMapper;
import top.chsis.model.Log;
import top.chsis.service.ILogService;

@Service("logService")
public class LogServiceImpl implements ILogService {
	@Autowired
	private LogMapper logMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return logMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Log record) {
		return logMapper.insert(record);
	}

	public int insertSelective(Log record) {
		return logMapper.insertSelective(record);
	}

	public Log selectByPrimaryKey(String uuid) {
		return logMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Log record) {
		return logMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Log record) {
		return logMapper.updateByPrimaryKey(record);
	}

}
