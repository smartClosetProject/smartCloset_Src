package com.spring.admin.aOrder.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AorderVO extends CommonVO{
	private long order_num =0;				
	private int order_totalPayment;
	private int order_prTotalPrice;
	private int od_totalPayment;
	private String order_state;		
	private String order_phone;	
	private String order_recipient;
	private String order_addr;
	private String order_shipmessage;
	private String order_cancelReason;	
	private String order_deliverydate;	
	private String order_regdate;			
	private String m_id;				

	private int od_num;			
	private int od_goodscount;	
	private String pr_name;
	private int pr_price;
	private String pro_size;
	private String pro_color;
	private String pro_num;
	private String pr_num;
}
