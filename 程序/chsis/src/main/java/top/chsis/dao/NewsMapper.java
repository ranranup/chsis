package top.chsis.dao;

import java.util.List;

import com.github.pagehelper.PageInfo;

import top.chsis.model.News;

public interface NewsMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);

	List<News> selectByCondition(News news);
	
	PageInfo<News> selectByConditionWithType(News news, int page, int size);

	List<News> selectByType(int type);

	List<News> selectByClick();
}