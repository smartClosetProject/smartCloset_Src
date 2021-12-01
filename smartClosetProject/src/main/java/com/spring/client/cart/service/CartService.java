package com.spring.client.cart.service;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> cartList(CartVO cvo);
}
