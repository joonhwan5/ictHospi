package com.spring.hospital.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class BoardAuthHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String writer = request.getParameter("user");
		System.out.println("게시물 작성자: " + writer);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login");
		
		if(id != null) {
			if(writer.equals(id)) {
				return true;
			}
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script> \r\n");
		out.print("alert('권한이 없습니다.'); \r\n");
		out.print("history.back(); \r\n");
		out.print("</script> \r\n");
		
		out.flush();
		response.sendRedirect(request.getContextPath() + "/");
		return false;
	}

}
