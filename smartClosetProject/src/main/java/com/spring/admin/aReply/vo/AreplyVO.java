package com.spring.admin.aReply.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class AreplyVO {
	private int r_num;
	private int q_num;
	private String r_name;
	private String r_content;
	private String r_regdate;

}
