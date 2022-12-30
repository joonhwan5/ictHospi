package com.spring.hospital.user.mapper;

import java.util.Map;

import com.spring.hospital.command.UserVO;

public interface IUserMapper {
	
	/* 회원 가입 */
	void join(UserVO vo);
	
	/* DB users Id 체크 */
	int idCheckUsers(String id);
	
	/* DB admin Id 체크 */
	int idCheckAdmin(String id);
	
	/* 로그인 */
	UserVO login(Map<String, Object> data);
	
}
