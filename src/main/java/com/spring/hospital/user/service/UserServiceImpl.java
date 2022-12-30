package com.spring.hospital.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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

}
