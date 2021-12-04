package com.spring.client.cart.service;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartService {
	int isExist(CartVO cvo);
	int insertCart(CartVO cvo);
	int deleteSelectCart(CartVO cvo);
	int deleteAllCart(CartVO cvo);
	int modifyCount(CartVO cvo);
	List<CartVO> cartList(CartVO cvo);
}
