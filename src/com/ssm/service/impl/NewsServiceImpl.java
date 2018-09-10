package com.ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.mapper.NewsMapper;
import com.ssm.pojo.News;
import com.ssm.pojo.NewsExample;
import com.ssm.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	NewsMapper newsMapper;

	@Override
	public List<News> list() {
		NewsExample example = new NewsExample();
		example.setOrderByClause("id asc");
		return newsMapper.selectByExample(example);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void add(News news) {
		newsMapper.insert(news);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void delete(int id) {
		newsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public News get(int id) {
		return newsMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void update(News news) {
		newsMapper.updateByPrimaryKeySelective(news);
	}

	@Override
	public int total() {
		return newsMapper.total();
	}

	@Override
	public List<News> searchNewsByKey(String key) {
		return newsMapper.searchNewsByKey(key);
	}

	@Override
	public List<News> findNewsByTime(Map map) {
		return newsMapper.findNewsByTime(map);
	}

}
