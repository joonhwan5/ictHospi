package com.spring.hospital.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.command.UserVO;
import com.spring.hospital.mypage.mapper.IMyPageMapper;

@Service
public class MyPageServiceImpl implements IMyPageService {
	
	@Autowired
	private IMyPageMapper mapper;
	
	@Override
	public void reserveRegist(ReservationVO vo) {
		mapper.reserveRegist(vo);
	}
	
	@Override
	public List<ReservationVO> getReserveList(String userId) {
		return mapper.getReserveList(userId);
	}

	@Override
	public ReservationVO getReserveOne(int reservNum) {
		return mapper.getReserveOne(reservNum);
	}
	
	@Override
	public void delete(int reservNum) {
		mapper.reserveDelete(reservNum);
	}
	
	@Override
	public UserVO userInfo(String id) {
		return mapper.userInfo(id);
	}
}
