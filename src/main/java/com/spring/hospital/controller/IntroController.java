package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.intro.service.IIntroService;

@Controller
@RequestMapping("/introduce")
public class IntroController {
	
	@Autowired
	private IIntroService introService;
	
	@Autowired
	private IAdminService adminService;
	
	
	@GetMapping("/introMain")
	public void introduce() {
		
	}
		
	@GetMapping("/introCome")
	public void introCome() {
		
	}
	
	//내과 의사들 소개 페이지로 이동
	@GetMapping("/introInternalMain")
	public void introInternalMain(Model model, String subject) {
		System.out.println(subject);
		model.addAttribute("doctorList", adminService.getDoctorList(subject));
	}
	
	//외과 의사들 소개 페이지로 이동
	@GetMapping("/introSurgeryMain")
	public void introSurgeryMain(Model model, String subject) {
		System.out.println(subject);
		model.addAttribute("doctorList", adminService.getDoctorList(subject));
	}
	
	//피부과 의사들 소개 페이지로 이동
	@GetMapping("/introSkinMain")
	public void introSkinMain(Model model, String subject) {
		System.out.println(subject);
		model.addAttribute("doctorList", adminService.getDoctorList(subject));
	}
	
	
}
