package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@GetMapping("/adminPageDetail")
	public void adminPageDetail() {}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {}
}
