package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.command.DoctorVO;
import com.spring.hospital.intro.service.IIntroService;

@Controller
@RequestMapping("introduce")
public class introController {
	
	@Autowired
	private IIntroService service;
	
	@GetMapping("/introMain")
	public void introduce() {
		
	}
	
	@GetMapping("/introDoctors")
	public void introDoctors() {
		
	}
	
	//각 의사 소개페이지로 이동
	@GetMapping("/doctorPage")
	public void doctorPage(String doctorName, String medicalDepartment) {
		service.doctorPage(doctorName, medicalDepartment);
	}
	
	//각 의사 정보 받아와서 뿌려주기
	@GetMapping("/doctorInfo")
	public void doctorInfo(int doctorNo, DoctorVO vo, Model model){
		model.addAttribute("doctor", service.getDoctorInfo(doctorNo));
	}
}
