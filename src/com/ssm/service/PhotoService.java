package com.ssm.service;

import java.util.List;

import com.ssm.pojo.Photo;

public interface PhotoService {
	public int delete(Integer id);

	public int add(Photo record);

	public List<Photo> list();

	public int update(Photo record);

	public int total();

	public List<Photo> searchPhotoByKey(String key);

	public Photo findPhotoByName(String name);

	public Photo findPhotoById(int id);

}
