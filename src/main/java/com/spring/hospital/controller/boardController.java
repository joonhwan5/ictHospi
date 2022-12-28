package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class boardController {
	
	@GetMapping("/boardMain")
	public void boardMain() {
		
	}
	
	@GetMapping("/boardClaim")
	public void boardClaim() {
		
	}
	
	@GetMapping("/boardFood")
	public void boardFood() {
		
	}
	
	@GetMapping("/mainDetail")
	public void mainDetail() {
		
	}
	
	@GetMapping("/claimDetail")
	public void claimDetail() {
		
	}
	
	@GetMapping("/foodDetail")
	public void foodDetail() {
		
	}
	
}
