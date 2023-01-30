package com.spring.hospital.util.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.spring.hospital.command.AdminVO;
import com.spring.hospital.command.UserVO;
import com.spring.hospital.user.mapper.IUserMapper;

public class AutoLoginInterceptor implements HandlerInterceptor{
	
	@Autowired
	private IUserMapper mapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		Cookie adminLoginCookie = WebUtils.getCookie(request, "adminLoginCookie");
		HttpSession session = request.getSession();
		
		if(loginCookie != null) {
			UserVO vo = mapper.getUserWithSessionId(loginCookie.getValue());
			if(vo != null) {
				//자동 로그인 신청한 사람의 로그인 데이터(세션)를 만들어 줍니다.
				session.setAttribute("login", vo.getUserId());
			}
		}
		
		if(adminLoginCookie != null) {
			AdminVO avo = mapper.getAdminWithSessionId(adminLoginCookie.getValue());
			if(avo != null) {
				session.setAttribute("admin", avo.getAdminId());
			}
		}
		
		return true;
	}
	
}
