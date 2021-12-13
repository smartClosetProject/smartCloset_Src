package com.spring.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.client.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class AuthLoginInterceptor extends HandlerInterceptorAdapter{
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        //String m_id = (String) session.getAttribute("m_id");
        MemberVO login = (MemberVO) session.getAttribute("login");
        
        String requestUrl = request.getRequestURL().toString();
        
        if(requestUrl.contains("/member/loginForm")){
        	return true;
        }
          
        if (login == null){
        	log.info("================= 시작 ===============");
            response.sendRedirect("/member/loginForm");
            return false;
        }
        
        return true;
    }
}