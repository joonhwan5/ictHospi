package com.spring.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.command.DoctorVO;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	private IAdminService service;
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {
		
	}
	
	@GetMapping("/adminPageDetail")
	public void adminPageDetail() {
		
	}
	
	@ResponseBody
	@PostMapping("/getDoctorList")
	public List<DoctorVO> getDoctorList(@RequestBody String subject) {
		System.out.println(subject);
		System.out.println(service.getDoctorList(subject));
		return service.getDoctorList(subject);
	}
	
	
	@PostMapping("/registDoctor")
	@ResponseBody
	public String registDoctor(DoctorVO vo, MultipartFile file) {
		service.registDoctor(vo, file);
		
		return "registSuccess";
		
		
	}
	
	
}
