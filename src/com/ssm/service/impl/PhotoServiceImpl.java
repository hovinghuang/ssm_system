package com.ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.mapper.PhotoMapper;
import com.ssm.pojo.Photo;
import com.ssm.pojo.PhotoExample;
import com.ssm.service.PhotoService;

@Service
public class PhotoServiceImpl implements PhotoService {
	@Autowired
	PhotoMapper photoMapper;

	@Override
	public int delete(Integer id) {
		return photoMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public int add(Photo record) {
		return photoMapper.insert(record);
	}

	@Override
	public List<Photo> list() {
		PhotoExample photo = new PhotoExample();
		photo.setOrderByClause("id asc");
		return photoMapper.selectByExample(photo);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public int update(Photo record) {
		return photoMapper.updateByPrimaryKey(record);
	}

	@Override
	public int total() {
		return photoMapper.total();
	}

	@Override
	public List<Photo> searchPhotoByKey(String key) {
		return photoMapper.searchPhotoByKey(key);
	}

	@Override
	public Photo findPhotoByName(String name) {
		return photoMapper.findPhotoByName(name);
	}

	@Override
	public Photo findPhotoById(int id) {
		return photoMapper.findPhotoById(id);
	}

	@Override
	public List<Photo> findPhotoByTime(Map map) {
		return photoMapper.findPhotoByTime(map);
	}

}
