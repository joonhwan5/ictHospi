package com.spring.hospital.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.hospital.command.ReasonOfWithdrawalVO;
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
	public UserVO userInfo(String id, Model model) {
		UserVO user = mapper.userInfo(id);
		String year = user.getUserBirth1().substring(0, 4);
		String month = user.getUserBirth1().substring(4, 6);
		String day = user.getUserBirth1().substring(6, 8);
		String email2 = user.getUserEmail2().substring(1);
		user.setUserEmail2(email2);
		
		if(month.substring(0,1).contains("0")) {
			month = month.substring(1);
		}
		
		if(day.substring(0, 1).contains("0")) {
			day = day.substring(1);
		}
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		return user;
	}
	
	@Override
	public void userUpdate(UserVO user) {
		mapper.userUpdate(user);
	}
	
	@Override
	public void userDelete(String id) {
		mapper.userDelete(id);
	}
	
	@Override
	public List<String> getTime(Map<String, String> data) {
		return mapper.getTime(data);
	}
	
	@Override
	public void reservModify(ReservationVO vo) {
		mapper.reservModify(vo);
	}
	
	@Override
	public void reasonOfWithdrawal(ReasonOfWithdrawalVO vo) {
		mapper.reasonOfWithdrawal(vo);
	}
	
	@Override
	public List<Integer> getPickupCount(String rvDate) {
		return mapper.getPickupCount(rvDate);
	}
	
	@Override
	public UserVO updateUserPw(String id, String oldPw, String newPw) {
		UserVO user = mapper.userInfo(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(oldPw, user.getUserPw())) {
			String pw = encoder.encode(newPw);
			Map<String, Object> data = new HashMap<>();
			data.put("id", id);
			data.put("pw", pw);
			mapper.updateUserPw(data);
			return user;
		} else {
			return null;
		}
	}
	
	@Override
	public int getTimePrev(Map<String, String> data1) {
		return mapper.getTimePrev(data1);
	}
}
