package com.spring.admin.aOrder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aOrder.dao.AorderDAO;
import com.spring.admin.aOrder.vo.AorderVO;

import lombok.Setter;

@Service
public class AorderServiceImpl implements AorderService{
	@Setter(onMethod_ = @Autowired)
	public AorderDAO aOrderDao;
	
	@Override
	public List<AorderVO> aOrderList(AorderVO aovo) {
		return aOrderDao.aOrderList(aovo);
	}

	@Override
	public int aOrderListCnt(AorderVO aovo) {
		return aOrderDao.aOrderListCnt(aovo);
	}

	@Override
	public List<AorderVO> aOrderProductDetail(AorderVO aovo) {
		return aOrderDao.aOrderProductDetail(aovo);
	}

	@Override
	public AorderVO aOrderDetail(AorderVO aovo) {
		return aOrderDao.aOrderDetail(aovo);
	}

	@Override
	public int aOrderChangeState(AorderVO aovo) {
		return aOrderDao.aOrderChangeState(aovo);
	}

	@Override
	public void aOrderAllDelete() {
		aOrderDao.aOrderAllDelete();
	}
	
	@Override
	public int aOrderChangeStock(AorderVO aovo) {
		return aOrderDao.aOrderChangeStock(aovo);
	}

	@Override
	public int aOrderOptionChange(AorderVO aovo) {
		return aOrderDao.aOrderOptionChange(aovo);
	}

	@Override
	public AorderVO aOrderReturnDetail(AorderVO aovo) {
		return aOrderDao.aOrderReturnDetail(aovo);
	}

	@Override
	public List<String> aGetProColor(AorderVO advo) {
		return aOrderDao.aGetProColor(advo);
	}

	@Override
	public List<String> aGetProSize(AorderVO advo) {
		return aOrderDao.aGetProSize(advo);
	}

	@Override
	public int aOrderTotalPayChange(AorderVO aovo) {
		return aOrderDao.aOrderTotalPayChange(aovo);
	}

	@Override
	public int aOdTotalPayChange(AorderVO aovo) {
		return aOrderDao.aOdTotalPayChange(aovo);
	}

}
