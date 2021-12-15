package com.spring.client.member.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class MyorderVO extends CommonVO{
	  private long order_num = 0;            // 주문 번호
	   private int order_totalPayment = 0;      // 결제금액
	   private String order_state = "";      // 주문 상태
	   private String order_regdate;         // 주문일
	   private String m_id = "";            // 회원 아이디
	 
	   private String pro_num = ""; //주문상품 이름
	   private int od_goodscount = 0; //주문 개수
	   private String pr_num = "";//
	   private String pr_name = "";
	   private String pr_thumb = "";
	   private String pro_colorthumb="";
	   
	   private int bd = 0;
	   private int bd1 = 0;
	   private int bd2 = 0;
	   private int bd3 = 0;
	   private int bd4 = 0;

}
