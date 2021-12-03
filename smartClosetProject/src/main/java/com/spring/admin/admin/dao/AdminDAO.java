package com.spring.admin.admin.dao;

import com.spring.admin.admin.vo.AdminVO;

public interface AdminDAO {

	public AdminVO adminLogin(AdminVO avo);
	public AdminVO adminInfo(AdminVO avo);

}
