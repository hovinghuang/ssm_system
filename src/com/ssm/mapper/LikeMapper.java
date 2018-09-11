package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.Like;
import com.ssm.pojo.LikeExample;

public interface LikeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Like record);

	int insertSelective(Like record);

	List<Like> selectByExample(LikeExample example);

	Like selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Like record);

	int updateByPrimaryKey(Like record);

	Like getLike(Map map);

	int total(int news_id);
}