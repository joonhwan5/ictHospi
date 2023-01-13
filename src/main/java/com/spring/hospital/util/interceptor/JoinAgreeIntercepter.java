package com.spring.hospital.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

public class JoinAgreeIntercepter implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getParameter("success") != null) {
			return true;
		} else {
			response.sendRedirect("/user/userAgree");
			FlashMap fm = new FlashMap();
			fm.put("msg", "약관에 동의를 하셔야 회원가입이 가능합니다.");
			FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
			fmm.saveOutputFlashMap(fm, request, response);
			return false;
		}
	}
}
