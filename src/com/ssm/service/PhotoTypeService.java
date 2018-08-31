package com.ssm.service;

import java.util.List;

import com.ssm.pojo.PhotoType;

public interface PhotoTypeService {
	public int delete(Integer id);

	public int add(PhotoType record);

	public List<PhotoType> list();

	public int update(PhotoType record);

	public PhotoType findPhotoTypeById(int id);

}
