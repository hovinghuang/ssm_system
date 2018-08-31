package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.PhotoTypeMapper;
import com.ssm.pojo.PhotoType;
import com.ssm.pojo.PhotoTypeExample;
import com.ssm.service.PhotoTypeService;

@Service
public class PhotoTypeServiceImpl implements PhotoTypeService {
	@Autowired
	PhotoTypeMapper photoTypeMapper;

	@Override
	public int delete(Integer id) {
		return photoTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int add(PhotoType record) {
		return photoTypeMapper.insert(record);
	}

	@Override
	public List<PhotoType> list() {
		PhotoTypeExample photoType = new PhotoTypeExample();
		photoType.setOrderByClause("id asc");
		return photoTypeMapper.selectByExample(photoType);
	}

	@Override
	public int update(PhotoType record) {
		return photoTypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public PhotoType findPhotoTypeById(int id) {
		return photoTypeMapper.findPhotoTypeById(id);
	}

}
