package com.spring.client.member.vo;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private int m_num = 0; // 회원번호
	private String m_id =""; // 회원아이디
	private String m_passwd = "";// 회원비밀번호
	private String m_name = ""; // 회원이름
	private String m_email = ""; // 회원이메일
	private String m_phone = ""; // 회원폰번호
	private String m_addr = ""; // 회원주소
	private String m_addr2 = ""; // 회원주소2
	private String m_addr3 = ""; // 회원주소3
	private String m_regdate = ""; // 회원등록일
	private String m_exitdate ; // 회원탈퇴일
	private int m_mile = 0; // 회원마일리지
	private int m_acc = 0; // 회원주문총금액
	
	
	
}
