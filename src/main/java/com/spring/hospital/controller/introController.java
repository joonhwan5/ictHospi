package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("introduce")
public class introController {
	
	@GetMapping("/introMain")
	public void introduce() {
		
	}
	
	@GetMapping("/introDoctors")
	public void introDoctors() {
		
	}
	
	@GetMapping("/introCome")
	public void introCome() {
		
	}
}
