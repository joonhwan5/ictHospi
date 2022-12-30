package com.spring.hospital.user.service;

import java.util.HashMap;
import java.util.Map;

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
	
	@Override
	public UserVO userLogin(String id) {
		return mapper.userLogin(id);
	}
	
	@Override
	public AdminVO adminLogin(String id, String pw) {
		Map<String, Object> data = new HashMap<>();
		data.put("id", id);
		data.put("pw", pw);
		return mapper.adminLogin(data);
	}

}
