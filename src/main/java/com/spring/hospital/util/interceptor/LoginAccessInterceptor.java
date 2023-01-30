package com.spring.hospital.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LoginAccessInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("login") == null) {
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/");
		FlashMap fm = new FlashMap();
		fm.put("msg", "로그인 중 입니다.");
		FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
		fmm.saveOutputFlashMap(fm, request, response);
		return false;
		
	}
	
}
