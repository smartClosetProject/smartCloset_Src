package com.spring.admin.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.admin.dao.AdminDAO;
import com.spring.admin.admin.vo.AdminVO;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_ = @Autowired)
	public AdminDAO adminDao;

	@Override
	public AdminVO adminInfo(AdminVO avo) {
		AdminVO info = adminDao.adminInfo(avo);
		return info;
	}

	@Override
	public AdminVO adminLogin(AdminVO avo) {
		return adminDao.adminLogin(avo);
	}

}
