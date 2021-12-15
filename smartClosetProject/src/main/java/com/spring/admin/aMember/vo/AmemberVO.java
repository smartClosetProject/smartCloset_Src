package com.spring.admin.aMember.vo;

import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AmemberVO extends CommonVO {
	private String m_id;
	private String m_passwd;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_addr;
	private String m_regdate;
	private String m_exitdate;
	private int m_mile;
	private int m_acc;
}
