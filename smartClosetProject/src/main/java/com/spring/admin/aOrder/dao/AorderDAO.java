package com.spring.admin.aOrder.dao;

import java.util.List;

import com.spring.admin.aOrder.vo.AorderDetailVO;
import com.spring.admin.aOrder.vo.AorderVO;

public interface AorderDAO {

	public List<AorderVO> aOrderList(AorderVO aovo);
	public int aOrderListCnt(AorderVO aovo);
	public List<AorderVO> aOrderProductDetail(AorderVO aovo);
	public AorderVO aOrderDetail(AorderVO aovo);
	public int aOrderChangeState(AorderVO aovo);
	public void aOrderAllDelete();
	public int returnOrder(AorderVO aovo);
	public AorderVO aOrderReturnDetail(AorderVO aovo);
	public List<String> aGetProColor(AorderDetailVO advo);
}
