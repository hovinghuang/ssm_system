package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.Photo;
import com.ssm.pojo.PhotoExample;

public interface PhotoMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Photo record);

	int insertSelective(Photo record);

	List<Photo> selectByExample(PhotoExample example);

	Photo selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Photo record);

	int updateByPrimaryKey(Photo record);

	int total();

	List<Photo> searchPhotoByKey(String key);

	Photo findPhotoByName(String name);

	Photo findPhotoById(int id);

	List<Photo> findPhotoByTime(Map map);
}