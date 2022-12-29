package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/food")
public class foodController {
	
	@GetMapping("/foodMain")
	public void foodMain() {
		
	}
	
	@GetMapping("/foodDetail")
	public void foodDetail() {
		
	}
	
}
