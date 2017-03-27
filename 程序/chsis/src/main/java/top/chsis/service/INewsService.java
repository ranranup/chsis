package top.chsis.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.News;

public interface INewsService {
	int deleteByPrimaryKey(String uuid);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

	PageInfo<News> selectByCondition(News news, int page, int size);

	PageInfo<News> selectByConditionWithType(News news, int page, int size);

	List<News> selectByType(int type);

	List<News> selectByClick();

}
