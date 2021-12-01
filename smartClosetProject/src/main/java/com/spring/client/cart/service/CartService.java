package com.spring.client.cart.service;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartService {
	public int isExist(CartVO cvo);
	public int insertCart(CartVO cvo);
	public int deleteEachCart(CartVO cvo);
	public int deleteAllCart(CartVO cvo);
	public int modifyCount(CartVO cvo);
	public List<CartVO> cartList(CartVO cvo);
}
