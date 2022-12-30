package com.spring.hospital.user.service;

import java.util.Map;

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
	UserVO userLogin(String id);
	
	/* 관리자 로그인 */
	AdminVO adminLogin(String id, String pw);
	
}
