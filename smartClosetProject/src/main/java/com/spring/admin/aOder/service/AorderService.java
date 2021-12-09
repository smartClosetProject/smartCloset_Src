package com.spring.admin.aOder.service;

import java.util.List;

import com.spring.admin.aOder.vo.AorderVO;

public interface AorderService {

	public List<AorderVO> aOrderList(AorderVO aovo);
	public int aOrderListCnt(AorderVO aovo);
	public List<AorderVO> aOrderProductDetail(AorderVO aovo);
	public AorderVO aOrderDetail(AorderVO aovo);
	public int aOrderChangeState(AorderVO aovo);
	public void aOrderAllDelete();
	public int returnOrder(AorderVO aovo);

}
