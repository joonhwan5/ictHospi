package com.spring.hospital.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

public class UserAuthHandler implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null || session.getAttribute("admin") != null) {
			if(session.getAttribute("admin") != null) {
				response.sendRedirect(request.getContextPath() + "/claim/claimMain");
				FlashMap fm = new FlashMap();
				fm.put("msg", "관리자는 사용이 불가능합니다.");
				FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
				fmm.saveOutputFlashMap(fm, request, response);
				return false;
			}
			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/user/userLogin");
			FlashMap fm = new FlashMap();
			fm.put("msg", "로그인을 하셔야 이용이 가능합니다.");
			FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
			fmm.saveOutputFlashMap(fm, request, response);
			return false;
		}
	}

}
