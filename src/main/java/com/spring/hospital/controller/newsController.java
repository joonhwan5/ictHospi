package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class newsController {

	@GetMapping("newsMain")
	public void newsMain() {

	}

	@GetMapping("newsDetail")
	public void newsDetail() {

	}

	@GetMapping("healthMain")
	public void healthMain() {

	}

	@GetMapping("healthDetail")
	public void healthDetail() {

	}

	@GetMapping("newsRegist")
	public void newsRegist() {

	}
	
}
