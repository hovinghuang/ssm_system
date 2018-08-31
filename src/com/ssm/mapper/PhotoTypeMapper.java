package com.ssm.mapper;

import java.util.List;

import com.ssm.pojo.PhotoType;
import com.ssm.pojo.PhotoTypeExample;

public interface PhotoTypeMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(PhotoType record);

	int insertSelective(PhotoType record);

	List<PhotoType> selectByExample(PhotoTypeExample example);

	PhotoType selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(PhotoType record);

	int updateByPrimaryKey(PhotoType record);

	PhotoType findPhotoTypeById(int id);
}