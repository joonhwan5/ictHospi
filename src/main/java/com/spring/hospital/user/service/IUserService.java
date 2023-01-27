package com.spring.hospital.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.hospital.command.AdminVO;
import com.spring.hospital.command.UserVO;

public interface IUserService {
	
	/* 회원 가입 */
	void join(UserVO vo);
	
	/* DB users Id 체크 */
	int idCheckUsers(String id);
	
	/* DB admin Id 체크 */
	int idCheckAdmin(String id);
	
	/* 로그인 */
	UserVO userLogin(String id, String pw, boolean autoLogin, HttpSession session, HttpServletResponse response);
	
	/* 관리자 로그인 */
	AdminVO adminLogin(String id, String pw, boolean autoLogin, HttpSession session, HttpServletResponse response);
	
	/* 로그아웃 */
	void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	
	/* 카카오 회원가입 */
	void kakaoJoin(UserVO vo);
	
	/* 아이디 가져오기 */
	List<UserVO> userFindId(String email1, String email2);
	
}
