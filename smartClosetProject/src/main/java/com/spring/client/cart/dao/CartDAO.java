package com.spring.client.cart.dao;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartList(CartVO cvo);
}
