package com.spring.admin.aOder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.aOder.dao.AorderDAO;
import com.spring.admin.aOder.vo.AorderVO;

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
	public int returnOrder(AorderVO aovo) {
		return aOrderDao.returnOrder(aovo);
	}

}
