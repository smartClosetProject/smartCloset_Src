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
	public int isExist(CartVO cvo) {
		int result = cartDao.isExist(cvo);
		return result;
	}
	
	@Override
	public int insertCart(CartVO cvo) {
		int result = cartDao.insertCart(cvo);
		return result;
	}
	
	@Override
	public int deleteSelectCart(CartVO cvo) {
		int result = cartDao.deleteSelectCart(cvo);
		return result;
	}

	@Override
	public int deleteAllCart(String m_id) {
		int result = cartDao.deleteAllCart(m_id);
		return result;
	}
	
	@Override
	public int modifyCount(CartVO cvo) {
		int result = cartDao.modifyCount(cvo);
		return result;
	}
	
	@Override
	public List<CartVO> cartList(CartVO cvo) {
		List<CartVO> cartList = cartDao.cartList(cvo);
		return cartList;
	}
}
