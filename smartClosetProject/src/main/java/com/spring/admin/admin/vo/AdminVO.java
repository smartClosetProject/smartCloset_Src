package com.spring.admin.admin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminVO {
	private int ad_num;
	private String ad_id;
	private String ad_passwd;
	private String ad_name;
	private String ad_regdate;
	private String ad_phone;
	private String ad_email;
	private String ad_addr;
}
