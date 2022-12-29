package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class myPageController {

	@GetMapping("/myPageMain")
	public void myPageMain() {
		
	}
	
	@GetMapping("/reservation")
	public void reservation() {
		
	}
	
	@GetMapping("/reservationDetail")
	public void reservationDetail() {
		
	}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {
		
	}
}
