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
	public NboardDAO nboardDao;

	@Override
	public List<NboardVO> nboardList(NboardVO nvo) {
		List<NboardVO> list = nboardDao.nboardList(nvo);
		return list;
	}

	@Override
	public NboardVO nboardDetail(NboardVO nvo) {
		NboardVO detail = null;
		detail = nboardDao.nboardDetail(nvo);
		if(detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

	@Override
	public int nboardInsert(NboardVO nvo) {
		int result = 0;
		result = nboardDao.nboardInsert(nvo);
		
		return result;
	}

	@Override
	public NboardVO updateForm(NboardVO nvo) {
		NboardVO update = nboardDao.nboardDetail(nvo);
		return update;
	}

	@Override
	public int nboardUpdate(NboardVO nvo) {
		int result = nboardDao.nboardUpdate(nvo);
		return result;
	}

	@Override
	public int nboardDelete(NboardVO nvo) {
		int result = nboardDao.nboardDelete(nvo);
		return result;
	}

}
