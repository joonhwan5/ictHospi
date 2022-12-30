package com.spring.hospital.mypage.service;

import java.util.List;

import com.spring.hospital.command.ReservationVO;

public interface IMyPageService {

	//예약 등록
	public void reserveRegist(ReservationVO vo);
	
	//예약 리스트
	public List<ReservationVO> getReserveList(String userId);
	
	//예약 디테일
	public ReservationVO getReserveOne(int reservNum);

	//예약 취소
	public void delete(int reservNum);
}
