package com.spring.hospital.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.spring.hospital.command.ReasonOfWithdrawalVO;
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
	
	// 회원 정보 가져오기
	UserVO userInfo(String id, Model model);
	
	// 회원 수정
	void userUpdate(UserVO user);
	
	// 회원 탈퇴
	void userDelete(String id);

	// 회원 비밀번호 수정
	UserVO updateUserPw(String id, String oldPw, String newPw);
	
	// 의사 가용 예약시간 확인
	public List<String> getTime(Map<String, String> data);

	//예약 수정
	public void reservModify(ReservationVO vo);
	
	// 탈퇴사유
	void reasonOfWithdrawal(ReasonOfWithdrawalVO vo);

	//탑승인원
	public List<Integer> getPickupCount(String rvDate);

	//예약한 날에는 추가 예약 못하게
	public int getTimePrev(Map<String, String> data1);
	
}
