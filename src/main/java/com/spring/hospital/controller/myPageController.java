package com.spring.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.command.UserVO;
import com.spring.hospital.mypage.service.IMyPageService;
import com.spring.hospital.mypage.service.IMyPageServiceImpl;

@Controller
@RequestMapping("/myPage")
public class myPageController {

	@Autowired
	private IMyPageService service;
	
	@GetMapping("/myPageMain")
	public void myPageMain() {
		
	}
	
	@GetMapping("/reservation")
	public void reservation(Model model, HttpSession session) {
		String userId;
		if((UserVO) session.getAttribute("login") == null) {
			userId = "jun8157";
		} else {
			userId = ((UserVO) session.getAttribute("login")).getUserId();
		}
		List<ReservationVO> list = service.getReserveList(userId);
		model.addAttribute("reserveList", list);
	}
	
	@GetMapping("/reservationDetail/{reservNum}")
	public String reservationDetail(@PathVariable int reservNum, Model model) {
		ReservationVO vo = service.getReserveOne(reservNum);
		model.addAttribute("reserve", vo);
		return "/myPage/reservationDetail";
	}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {
		
	}
}
