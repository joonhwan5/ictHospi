package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class foodController {
	
	@GetMapping("/boardFood")
	public void boardFood() {
		
	}
	
	@GetMapping("/foodDetail")
	public void foodDetail() {
		
	}

}
