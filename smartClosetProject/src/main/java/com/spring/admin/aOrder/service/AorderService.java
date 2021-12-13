package com.spring.admin.aOrder.service;

import java.util.List;

import com.spring.admin.aOrder.vo.AorderDetailVO;
import com.spring.admin.aOrder.vo.AorderVO;

public interface AorderService {

	public List<AorderVO> aOrderList(AorderVO aovo);
	public int aOrderListCnt(AorderVO aovo);
	public List<AorderVO> aOrderProductDetail(AorderVO aovo);
	public AorderVO aOrderDetail(AorderVO aovo);
	public int aOrderChangeState(AorderVO aovo);
	public void aOrderAllDelete();
	public int aOrderOptionChange(AorderVO aovo);
	public AorderVO aOrderReturnDetail(AorderVO aovo);
	public List<String> aGetProColor(AorderVO advo);
	public List<String> aGetProSize(AorderVO advo);
	public int aOrderTotalPayChange(AorderVO aovo);
	public int aOdTotalPayChange(AorderVO aovo);
}
