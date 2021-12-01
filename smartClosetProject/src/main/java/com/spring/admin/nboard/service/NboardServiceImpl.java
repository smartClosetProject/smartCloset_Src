package com.spring.admin.nboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.nboard.dao.NboardDAO;
import com.spring.admin.nboard.vo.NboardVO;

import lombok.Setter;

@Service
public class NboardServiceImpl implements NboardService{
	@Setter(onMethod_ = @Autowired)
	public NboardDAO dao;

	@Override
	public List<NboardVO> nboardList(NboardVO bvo) {
		List<NboardVO> list = dao.nboardList(bvo);
		return list;
	}

}
