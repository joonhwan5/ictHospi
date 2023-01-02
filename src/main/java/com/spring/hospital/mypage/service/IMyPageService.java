package com.spring.hospital.mypage.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.command.UserVO;

public interface IMyPageService {

	//예약 등록
	public void reserveRegist(ReservationVO vo);
	
	//예약 리스트
	public List<ReservationVO> getReserveList(String userId);
	
	//예약 디테일
	public ReservationVO getReserveOne(int reservNum);

	//예약 취소
	public void delete(int reservNum);
	
	// 수정
	UserVO userInfo(String id);
	
	// 수정
	void userUpdate(UserVO user);
	
	// 탈퇴
	void userDelete(String id);
}
