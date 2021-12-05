package com.spring.common.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PrCommonVO {
	private String search=""; //검색 대상
	private String keyword=""; //검색 키워드
	
	private int pageNum = 0; //페이지 번호
	private int amount = 0; //페이지에 보여줄 데이터 수
	
	private String start_date=""; //날짜 검색 시작일
	private String end_date=""; //날짜 검색 종료일
	
	public PrCommonVO(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
