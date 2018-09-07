package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.NewsTypeMapper;
import com.ssm.pojo.NewsType;
import com.ssm.pojo.NewsTypeExample;
import com.ssm.service.NewsTypeService;

@Service
public class NewsTypeServiceImpl implements NewsTypeService {
	@Autowired
	NewsTypeMapper newsTypeMapper;

	@Override
	public int delete(Integer id) {
		return newsTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int add(NewsType record) {
		return newsTypeMapper.insert(record);
	}

	@Override
	public List<NewsType> list() {
		NewsTypeExample newsType = new NewsTypeExample();
		newsType.setOrderByClause("id asc");
		return newsTypeMapper.selectByExample(newsType);
	}

	@Override
	public int update(NewsType record) {
		return newsTypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public NewsType findNewsTypeById(int id) {
		return newsTypeMapper.findNewsTypeById(id);
	}

}
