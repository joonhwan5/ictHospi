package com.spring.hospital.user.mapper;

import java.util.List;
import java.util.Map;

import com.spring.hospital.command.AdminVO;
import com.spring.hospital.command.UserVO;

public interface IUserMapper {
	
	/* 회원 가입 */
	void join(UserVO vo);
	
	/* DB users Id 체크 */
	int idCheckUsers(String id);
	
	/* DB admin Id 체크 */
	int idCheckAdmin(String id);
	
	/* 유저 로그인 */
	UserVO userLogin(String id);
	
	/* 관리자 로그인 */
	AdminVO adminLogin(Map<String, Object> data);
	
	/* 유저 만든 쿠키 */
	void keepUserLogin(Map<String, Object> data);
	
	/* 관리자 만든 쿠키 */
	void keepAdminLogin(Map<String, Object> data);
	
	/* 유저 자동 로그인 */
	UserVO getUserWithSessionId(String sessionId);
	
	/* 관리자 자동 로그인 */
	AdminVO getAdminWithSessionId(String sessionId);
	
	/* 세션으로 관리자 정보 가져오기 */
	AdminVO adminInfo(String id);
	
	/* 아이디 가져오기 */
	List<UserVO> userFindId(Map<String, Object> data);
	
	/* 아이디, 이메일 체크 */
	UserVO userFindPw(Map<String, Object> data);
	
	/* 임시비밀번호 변경 */
	void userUpdatePw(Map<String, Object> data);
}
