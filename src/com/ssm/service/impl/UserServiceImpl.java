package com.ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import com.ssm.pojo.UserExample;
import com.ssm.service.UserRoleService;
import com.ssm.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	@Autowired
	UserRoleService userRoleService;

	@Override
	public String getPassword(String name) {
		User user = getByName(name);
		if (null == user)
			return null;
		return user.getPassword();
	}

	@Override
	public User getByName(String name) {
		UserExample example = new UserExample();
		example.createCriteria().andNameEqualTo(name);
		List<User> users = userMapper.selectByExample(example);
		if (users.isEmpty())
			return null;
		return users.get(0);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void add(User u) {
		userMapper.insert(u);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void delete(Long id) {
		userMapper.deleteByPrimaryKey(id);
		userRoleService.deleteByUser(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public void update(User u) {
		userMapper.updateByPrimaryKeySelective(u);
	}

	@Override
	public User get(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<User> list() {
		UserExample example = new UserExample();
		example.setOrderByClause("id asc");//
		return userMapper.selectByExample(example);

	}

	@Override
	public int total() {
		return userMapper.total();
	}

	@Override
	public List<User> searchUserByKey(String key) {
		return userMapper.searchUserByKey(key);
	}

	@Override
	public User findUserByName(String name) {
		return userMapper.findUserByName(name);
	}

	@Override
	public List<User> findUserByTime(Map map) {
		return userMapper.findUserByTime(map);
	}

}