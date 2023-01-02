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

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.mypage.service.IMyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private IMyPageService service;
	
	@GetMapping("/myPageMain")
	public void myPageMain(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("user", service.userInfo(id));
	}
	
	@GetMapping("/reservation")
	public void reservation(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("login");
		List<ReservationVO> list = service.getReserveList(userId);
		model.addAttribute("reserveList", list);
	}
	
	@GetMapping("/reservationDetail/{reservNum}")
	public String reservationDetail(@PathVariable int reservNum, Model model) {
		ReservationVO vo = service.getReserveOne(reservNum);
		model.addAttribute("reserve", vo);
		return "/myPage/reservationDetail";
	}
	
	@GetMapping("/reservationDelete/{reservNum}")
	public String reservationDelete(@PathVariable int reservNum) {
		
		service.delete(reservNum);
		
		return "redirect:/myPage/reservation";
	}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {}
	
	@PostMapping("/userModify")
	public String userModify() {
		return null;
	}
	
	@GetMapping("/userWithdrawal")
	public void userWithdrawal() {}
	
}




















