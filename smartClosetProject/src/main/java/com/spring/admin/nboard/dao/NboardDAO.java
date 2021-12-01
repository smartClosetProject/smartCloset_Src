package com.spring.admin.nboard.dao;

import java.util.List;

import com.spring.admin.nboard.vo.NboardVO;

public interface NboardDAO {
	public List<NboardVO> nboardList(NboardVO bvo);

}
