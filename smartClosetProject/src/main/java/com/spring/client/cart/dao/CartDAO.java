package com.spring.client.cart.dao;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartDAO {
	public int isExist(CartVO cvo); // 이미 존재하는 상품인지 여부
	public int insertCart(CartVO cvo); // 장바구니 추가
	public int deleteEachCart(CartVO cvo); // 장바구니 개별 삭제
	public int deleteAllCart(CartVO cvo); // 장바구니 전체 삭제
	public int modifyCount(CartVO cvo); // 상품 개수 변경
	public List<CartVO> cartList(CartVO cvo); // 장바구니 리스트
}
