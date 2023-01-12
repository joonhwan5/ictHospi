package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hospital.admin.service.IAdminService;

@Controller
@RequestMapping("/util")
public class UtilController {

	@Autowired
	private IAdminService service;
	
	@GetMapping("/popup")
	public void popup() {}
	
	@GetMapping("/ictChatBot")
	public void ictChatBot(Model model) {
		model.addAttribute("doctorList", service.getDoctorlistAdmin());
	}
	
	@PostMapping("/chatKeyword")
	@ResponseBody
	public String chatKeyword(@RequestBody String keyword) {
		System.out.println("Param(keyword): " + keyword);
		return "success";
	}
}
