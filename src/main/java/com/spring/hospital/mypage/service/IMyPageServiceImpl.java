package com.spring.hospital.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.mypage.mapper.IMyPageMapper;

@Service
public class IMyPageServiceImpl implements IMyPageService {
	
	@Autowired
	IMyPageMapper mapper;
	
	@Override
	public void reserveRegist(ReservationVO vo) {
		mapper.reserveRegist(vo);
	}
	
	@Override
	public List<ReservationVO> getReserveList() {
		return mapper.getReserveList();
	}
}
