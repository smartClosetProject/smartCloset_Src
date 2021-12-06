package com.spring.client.cart.service;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartService {
	int isExist(CartVO cvo);
	int insertCart(CartVO cvo);
	int deleteSelectCart(int cart_num);
	int deleteAllCart(String m_id);
	int modifyCount(CartVO cvo);
	List<CartVO> cartList(CartVO cvo);
}
