package com.spring.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.mypage.service.IMyPageServiceImpl;

@Controller
@RequestMapping("/myPage")
public class myPageController {

	@Autowired
	IMyPageServiceImpl service;
	
	@GetMapping("/myPageMain")
	public void myPageMain() {
		
	}
	
	@PostMapping("/reservationRegist")
	public String newReserve(ReservationVO vo, RedirectAttributes ra) {
		
		service.reserveRegist(vo);
		
		return "redirect:/myPage/reservation";
	}
	
	@GetMapping("/reservation")
	public void reservation(Model model) {
		List<ReservationVO> list = service.getReserveList();
		model.addAttribute("reserveList", list);
	}
	
	@GetMapping("/reservationDetail")
	public void reservationDetail() {
		
	}
	
}
