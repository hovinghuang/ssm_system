package com.ssm.mapper;

import java.util.List;

import com.ssm.pojo.NewsType;
import com.ssm.pojo.NewsTypeExample;

public interface NewsTypeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(NewsType record);

	int insertSelective(NewsType record);

	List<NewsType> selectByExample(NewsTypeExample example);

	NewsType selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(NewsType record);

	int updateByPrimaryKey(NewsType record);

	NewsType findNewsTypeById(int id);
}