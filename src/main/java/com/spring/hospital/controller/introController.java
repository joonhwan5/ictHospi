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
	
	//병원 오시는 길 페이지로 이동
	@GetMapping("/introCome")
	public void introCome() {
		
	}
	
	
	/*
	//관리자가 사용하는 의사 등록/수정 페이지로 이동
	@GetMapping("/introAdmin")
	public void introAdmin() {
		
	}
	*/
	
}
