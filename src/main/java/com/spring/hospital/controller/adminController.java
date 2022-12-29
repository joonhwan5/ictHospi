package com.spring.hospital.controller;

<<<<<<< HEAD
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.command.DoctorVO;
=======
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
>>>>>>> origin/doyoung

@Controller
@RequestMapping("/admin")
public class adminController {
	
<<<<<<< HEAD
	@Autowired
	IAdminService service;
	
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
=======
	@GetMapping("/adminPageDetail")
	public void adminPageDetail() {}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {}
>>>>>>> origin/doyoung
}
