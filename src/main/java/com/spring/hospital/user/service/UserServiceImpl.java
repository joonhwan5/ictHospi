package com.spring.hospital.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.AdminVO;
import com.spring.hospital.command.UserVO;
import com.spring.hospital.user.mapper.IUserMapper;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public void join(UserVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(vo.getUserPw());
		vo.setUserPw(securePw);
		mapper.join(vo);
	}

	@Override
	public int idCheckUsers(String id) {
		return mapper.idCheckUsers(id);
	}
	
	@Override
	public int idCheckAdmin(String id) {
		return mapper.idCheckAdmin(id);
	}
	
//	@Override
//	public UserVO userLogin(String id) {
//		return mapper.userLogin(id);
//	}
//	
//	@Override
//	public AdminVO adminLogin(String id, String pw) {
//		Map<String, Object> data = new HashMap<>();
//		data.put("id", id);
//		data.put("pw", pw);
//		return mapper.adminLogin(data);
//	}
	
	@Override
	public UserVO userLogin(String id, String pw, HttpSession session, HttpServletResponse response) {
		UserVO user = mapper.userLogin(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(mapper.userLogin(id) != null) {
			if(encoder.matches(pw, user.getUserPw())) {
				session.setAttribute("login", user.getUserId());
				Map<String, Object> data = new HashMap<>();
				long limitTime = 60*60*24*90;
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge((int) limitTime);
				response.addCookie(loginCookie);
				
				long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
				Date limitDate = new Date(expiredDate);
				data.put("userId", user.getUserId());
				data.put("limitDate", limitDate);
				data.put("sessionId", session.getId());
				mapper.keepUserLogin(data);
				
				return user;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
	
	@Override
	public AdminVO adminLogin(String id, String pw, HttpSession session, HttpServletResponse response) {
		Map<String, Object> data = new HashMap<>();
		data.put("id", id);
		data.put("pw", pw);
		AdminVO admin = mapper.adminLogin(data);
		if(admin != null) {
			session.setAttribute("admin", admin.getAdminId());
			Map<String, Object> aData = new HashMap<>();
			long limitTime = 60*60*24*90;
			
			Cookie adminLoginCookie = new Cookie("adminLoginCookie", session.getId());
			adminLoginCookie.setPath("/");
			adminLoginCookie.setMaxAge((int) limitTime);
			response.addCookie(adminLoginCookie);
			
			long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
			Date limitDate = new Date(expiredDate);
			aData.put("userId", admin.getAdminId());
			aData.put("limitDate", limitDate);
			aData.put("sessionId", session.getId());
			mapper.keepAdminLogin(aData);
			
			return admin;
		}
		return null;
	}
}







