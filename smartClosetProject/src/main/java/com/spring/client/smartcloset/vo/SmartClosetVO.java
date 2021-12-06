package com.spring.client.smartcloset.vo;

import lombok.Data;

@Data
public class SmartClosetVO {
	private int sc_num = 0;			// 스마트옷장 번호
	private String sc_tag1 = "";	// 커스텀 태그1(구매 - 카테고리.대)
	private String sc_tag2 = "";	// 커스텀 태그2(구매 - 카테고리.소)
	private String sc_tag3 = "";	// 커스텀 태그3(구매 - 계절)
	private String sc_tag4 = "";	// 커스텀 태그4
	private String sc_tag5 = "";	// 커스텀 태그5
	private String sc_isBuy = "";	// 구매여부
	private String sc_image = "";	// 대표 이미지
	private String sc_thumb = "";	// 상품 컬러 이미지
	private String sc_regdate;		// 이미지 썸네일
	private String m_id = "";		// 회원 아이디
	
	private String cart_num = "";	// 카트 번호
}
