package com.spring.client.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.cart.dao.CartDAO;
import com.spring.client.cart.vo.CartVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartDAO cartDao;

	@Override
	public List<CartVO> cartList(CartVO cvo) {
		
		return null;
	}

}
