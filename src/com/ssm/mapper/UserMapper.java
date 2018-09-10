package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import com.ssm.pojo.User;
import com.ssm.pojo.UserExample;

public interface UserMapper {
	int deleteByPrimaryKey(Long id);

	int insert(User record);

	int insertSelective(User record);

	List<User> selectByExample(UserExample example);

	User selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	int total();

	List<User> searchUserByKey(String key);

	User findUserByName(String name);

	List<User> findUserByTime(Map map);
}