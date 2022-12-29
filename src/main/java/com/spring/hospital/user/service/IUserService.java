package com.spring.hospital.user.service;

import com.spring.hospital.command.UserVO;

public interface IUserService {
	
	/* 회원 가입 */
	void join(UserVO vo);
	
	/* DB users Id 체크 */
	int idCheckUsers(String id);
	
	/* DB admin Id 체크 */
	int idCheckAdmin(String id);
	
}
