package com.spring.admin.admin.service;

import com.spring.admin.admin.vo.AdminVO;

public interface AdminService {
	
	public AdminVO adminLogin(AdminVO avo);
	public AdminVO adminInfo(AdminVO avo);
	public AdminVO readAdminInfo(String ad_id);
	public int adminUpdate(AdminVO avo);

}