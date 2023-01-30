package com.spring.hospital.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class BoardAuthHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("게시판 권한 인터셉터 발동!");
		
		String writer = request.getParameter("writer");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login");
		
		System.out.println("화면에서 넘어오는 작성자: " + writer);
		System.out.println("세션에 저장된 값: " + id);
		
		if(id != null) {
			if(writer.equals(id)) {
				System.out.println("글쓴이가 맞음");
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
		return false;
	}

}
