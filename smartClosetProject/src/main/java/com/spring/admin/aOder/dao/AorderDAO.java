package com.spring.admin.aOder.dao;

import java.util.List;

import com.spring.admin.aOder.vo.AorderVO;

public interface AorderDAO {

	public List<AorderVO> aOrderList(AorderVO aovo);
	public int aOrderListCnt(AorderVO aovo);
	public List<AorderVO> aOrderProductDetail(AorderVO aovo);
	public AorderVO aOrderDetail(AorderVO aovo);
	public int aOrderChangeState(AorderVO aovo);
	public void aOrderAllDelete();
	public int aOrderChangeStock(AorderVO aovo);
}
