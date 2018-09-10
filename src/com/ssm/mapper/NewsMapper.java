package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.News;
import com.ssm.pojo.NewsExample;

public interface NewsMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(News record);

	int insertSelective(News record);

	List<News> selectByExampleWithBLOBs(NewsExample example);

	List<News> selectByExample(NewsExample example);

	News selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(News record);

	int updateByPrimaryKeyWithBLOBs(News record);

	int updateByPrimaryKey(News record);

	int total();

	List<News> searchNewsByKey(String key);

	List<News> findNewsByTime(Map map);
}