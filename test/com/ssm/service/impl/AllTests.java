package com.ssm.service.impl;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.mapper.RoleMapper;
import com.ssm.service.PermissionService;
import com.ssm.service.RolePermissionService;
import com.ssm.service.RoleService;

@RunWith(Suite.class)
@SuiteClasses({})
public class AllTests {
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	RoleService roleService;
	@Autowired
	RolePermissionService rolePermissionService;
	@Autowired
	PermissionService permissionService;

	// @Test
	// public void testUpdate() {
	// Role role = new Role();
	// role.setName("22");
	// role.setDesc_("hhhhhhhhhh");
	// roleMapper.updateByPrimaryKeySelective(role);
	//
	// }

}
