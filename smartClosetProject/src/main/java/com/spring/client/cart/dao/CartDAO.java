package com.spring.client.cart.dao;

import java.util.List;

import com.spring.client.cart.vo.CartVO;

public interface CartDAO {
	int isExist(CartVO cvo); // 이미 존재하는 상품인지 여부
	int insertCart(CartVO cvo); // 장바구니 추가
	int deleteSelectCart(CartVO cvo); // 장바구니 개별 삭제
	int deleteAllCart(CartVO cvo); // 장바구니 전체 삭제
	int modifyCount(CartVO cvo); // 상품 개수 변경
	List<CartVO> cartList(CartVO cvo); // 장바구니 리스트
}
