package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.introduce.IIntroDoctorsService;

@Controller
@RequestMapping("/introduce")
public class introController {
	
	@Autowired
	private IIntroDoctorsService service;
	
	@GetMapping("/introMain")
	public void introduce() {
		
	}
	
	//각 의사 소개페이지로 이동
	@GetMapping("/introDoctors")
	public void introDoctors(String doctorName, String medicalDepartment) {
		service.getDoctorInfo(doctorName, medicalDepartment);
	}
	
	//의사 정보 화면에 뿌려주기
	
}
