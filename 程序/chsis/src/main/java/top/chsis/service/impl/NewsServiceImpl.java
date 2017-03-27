package top.chsis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.chsis.dao.NewsMapper;
import top.chsis.model.News;
import top.chsis.service.INewsService;

@Service("newsService")
public class NewsServiceImpl implements INewsService {
	@Autowired
	private NewsMapper newsMapper;
	
	public int deleteByPrimaryKey(String uuid) {
		return newsMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(News record) {
		return newsMapper.insert(record);
	}

	public int insertSelective(News record) {
		return newsMapper.insertSelective(record);
	}

	public News selectByPrimaryKey(String uuid) {
		News select = newsMapper.selectByPrimaryKey(uuid);
		News news = new News();
		news.setUuid(uuid);
		int click = 0;
		if(select.getClick() != null && !select.getClick().equals("")) {
			click = select.getClick();
		}
		news.setClick(click + 1);
		newsMapper.updateByPrimaryKeySelective(news);
		return select;
	}

	public int updateByPrimaryKeySelective(News record) {
		return newsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(News record) {
		return newsMapper.updateByPrimaryKey(record);
	}

	public PageInfo<News> selectByCondition(News news, int page, int size) {
		PageHelper.startPage(page, size);
		List<News> list = new ArrayList<News>();
		list = newsMapper.selectByCondition(news);
		PageInfo<News> pageInfo = new PageInfo<News>(list);
		return pageInfo;
	}

	public PageInfo<News> selectByConditionWithType(News news, int page, int size) {
		PageHelper.startPage(page, size);
		PageHelper.orderBy("publishTime desc");
		List<News> list = newsMapper.selectByCondition(news);
		PageInfo<News> pageInfo = new PageInfo<News>(list);
		return pageInfo;
	}

	public List<News> selectByType(int type) {
		return newsMapper.selectByType(type);
	}

	public List<News> selectByClick() {
		return newsMapper.selectByClick();
	}

}
