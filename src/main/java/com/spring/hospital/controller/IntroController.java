package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.command.DoctorVO;
import com.spring.hospital.intro.service.IIntroService;

@Controller
@RequestMapping(value={"/introduce", "/include"})
public class IntroController {
	
	@Autowired
	private IIntroService introService;
	
	@Autowired
	private IAdminService adminService;
	
	
	@GetMapping("/introMain/{num}")
	public String introduce(@PathVariable String num, Model model) {
		
		model.addAttribute("showBody", num);
		
	return "/introduce/introMain";
	}
	
	// 오시는길 길 페이지 이동
	@GetMapping("/introCome")
	public void introCome() {}
	
	// 주변 약국 페이지 이동
	@GetMapping("/introPharmacy")
	public void introPharmacy() {}
	
	//내과 의사들 소개 페이지로 이동
	@GetMapping("/introInternalMain")
	public void introInternalMain(Model model, String subject) {
		System.out.println(subject);
		model.addAttribute("doctorList", adminService.getDoctorList(subject));
	}
	
	//의사 개별 페이지로 이동
	@GetMapping("/introDoctors/{doctorNo}")
	public String introDoctors(@PathVariable int doctorNo, @ModelAttribute("d") DoctorVO vo, Model model) {
		model.addAttribute("doctors", introService.getDoctorInfo(doctorNo));
		return "introduce/introDoctors";
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
	
	//푸터 고객센터 페이지 이동
	@GetMapping("/footerService")
	public void footerService() {
		
	}
	
	//푸터 이용약관 페이지 이동
	@GetMapping("/footerAgree")
	public void footerAgree() {
		
	}
	
}
