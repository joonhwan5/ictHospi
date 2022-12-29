package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.intro.service.IIntroService;

@Controller
@RequestMapping("/introduce")
public class introController {
	
	@Autowired
	private IIntroService service;
	
	@GetMapping("/introMain")
	public void introduce() {
		
	}
	
	//내과 의사 페이지로 이동
	@GetMapping("/introInternal")
	public void introInternal() {
		
	}
	
	
	//외과 의사 페이지로 이동
	@GetMapping("/introOrtho")
	public void introOrtho() {
		
	}
	
	//피부과 의사 페이지로 이동
	@GetMapping("/introSkin")
	public void introSkin() {
		
	}
	
	@GetMapping("/introCome")
	public void introCome() {
		
	}
	
	
}