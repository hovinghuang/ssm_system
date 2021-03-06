package com.ssm.mapper;

import java.util.List;

import com.ssm.pojo.Permission;
import com.ssm.pojo.PermissionExample;

public interface PermissionMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Permission record);

	int insertSelective(Permission record);

	List<Permission> selectByExample(PermissionExample example);

	Permission selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKey(Permission record);

	int total();
}