package com.spring.client.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private long order_num = 0;				// 주문 번호
	private int order_totalPayment = 0;		// 결제금액
	private String order_state = "";		// 주문 상태
	private String order_cancelReason = "";	// 주문 취소 사유
	private String order_deliveryDate = "";	// 배송 완료 날짜
	private String order_regdate;			// 주문일
	private String m_id = "";				// 회원 아이디
	
	private String m_name = "";				// 회원 이름
	private String m_addr = "";				// 우편 번호
	private String m_addr2 = "";			// 회원 주소
	private String m_addr3 = "";			// 회원 상세주소
	private String m_phone = "";			// 휴대폰번호
	private String m_email = "";			// 회원 이메일
	private int m_mile = 0;					// 적립금
	
	private int m_mileApply = 0;			// 사용 적립금
	private int m_mileAdd = 0;				// 추가 적립금
	private String shipMessage = "";		// 배송 메시지
	private String payMethod = "";			// 결제 수단
	
	private int cart_num = 0;				// 카트 번호
	private int cart_goodsCount = 0;		// 상품 개수
	private String pro_color = "";			// 색상
	private String pro_size = "";			// 사이즈
	private String pro_colorthumb = "";		// 썸네일
	private String pr_name = "";			// 상품명
	private int pr_price = 0;				// 상품가격
}
