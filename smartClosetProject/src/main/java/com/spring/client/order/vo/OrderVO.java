package com.spring.client.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int order_num = 0;				// 주문 번호
	private String order_recipient = "";	// 수령인
	private String order_address = "";		// 배송지
	private int order_totalPayment = 0;		// 결제금액
	private String order_state = "";		// 주문 상태
	private String order_cancelReason = "";	// 주문 취소 사유
	private String order_deliveryDate = "";	// 배송 완료 날짜
	private String order_regdate;			// 주문일
	private String m_id = "";				// 회원 아이디
	
	private String m_name = "";				// 회원 이름
	private String m_addr = "";				// 회원 주소
	private String m_phone = "";			// 휴대폰번호
	private String m_email = "";			// 회원 이메일
	private int m_mile = 0;					// 적립금
}
