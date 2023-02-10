package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.admin.service.IAdminService;

@Controller
@RequestMapping("/introduce")
public class IntroController {

	@Autowired
	private IAdminService adminService;
	
	
	@GetMapping("/introMain/{num}")
	public String introduce(@PathVariable String num, Model model) {
		int parsingNum;
		
		try {
			parsingNum = Integer.parseInt(num);
			
			if(parsingNum == 1 || parsingNum == 2) {
				model.addAttribute("showBody", parsingNum);
				return "introduce/introMain";
			} else {
				model.addAttribute("introMsg", "잘못된 접근입니다.");
				return "introduce/introMain";
			}
		} catch (Exception e) {
			model.addAttribute("introMsg", "잘못된 접근입니다.");
			return "introduce/introMain";
		}
		

	}
	
	// 오시는길 길 페이지 이동
	@GetMapping("/introCome")
	public void introCome() {}
	
	// 주변 약국 페이지 이동
	@GetMapping("/introPharmacy")
	public void introPharmacy() {}
	
	//내과 의사들 소개 페이지로 이동
	@GetMapping("/introDoctor")
	public void introInternalMain(Model model, String subject) {
		if(subject.equals("내과") || subject.equals("외과") || subject.equals("피부과")) {
			model.addAttribute("doctorList", adminService.getDoctorList(subject));
		} else {
			model.addAttribute("msg", "잘못된 접근입니다.");
		}
	}
	
}
