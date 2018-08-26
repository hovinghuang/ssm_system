package com.ssm.service;

import java.util.List;

import com.ssm.pojo.User;

public interface UserService {
	public String getPassword(String name);

	public User getByName(String name);

	public List<User> list();

	public void add(User user);

	public void delete(Long id);

	public User get(Long id);

	public void update(User user);

	public int total();

	public List<User> searchUserByKey(String key);

	public User findUserByName(String name);
}