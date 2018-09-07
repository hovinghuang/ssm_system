package com.ssm.service;

import java.util.List;

import com.ssm.pojo.NewsType;

public interface NewsTypeService {
	public int delete(Integer id);

	public int add(NewsType record);

	public List<NewsType> list();

	public int update(NewsType record);

	public NewsType findNewsTypeById(int id);
}
