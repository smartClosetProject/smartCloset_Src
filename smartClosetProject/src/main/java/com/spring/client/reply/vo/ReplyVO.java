package com.spring.client.reply.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class ReplyVO {
	private int re_num   =0;       
	private int q_num   =0; 
	private String r_name  ="";
	private String r_content ="";
	private String r_passwd ="";
	private String r_regdate="";
}
