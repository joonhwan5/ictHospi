package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/util")
public class UtilController {

	@GetMapping("/popup")
	public void popup() {}
	
	@GetMapping("/ictChatBot")
	public void ictChatBot() {}
	
	@PostMapping("/chatKeyword")
	@ResponseBody
	public String chatKeyword(@RequestBody String keyword) {
		System.out.println("Param(keyword): " + keyword);
		return "success";
	}
}
