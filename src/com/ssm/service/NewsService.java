package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.News;

public interface NewsService {

	public List<News> list();

	public void add(News news);

	public void delete(int id);

	public News get(int id);

	public void update(News news);

	public int total();

	public List<News> searchNewsByKey(String key);

	public List<News> findNewsByTime(Map map);

}
