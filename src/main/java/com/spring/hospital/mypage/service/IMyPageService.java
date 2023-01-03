package com.spring.hospital.mypage.service;

import java.util.List;
import java.util.Map;

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

	// 의사 가용 예약시간 확인
	public List<String> getTime(Map<String, String> data);

	//예약 수정
	public void reservModify(ReservationVO vo);
}
