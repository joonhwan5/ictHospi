package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	@GetMapping("/adminPageMain")
	public void adminPageMain(Model model) {
		model.addAttribute("doctorList", service.getDoctorlistAdmin());
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
	
	
	@GetMapping("/doctorDisplay")
	public ResponseEntity<byte[]> doctorDisplay(String fileLoca, String fileName) {
		File file = new File("C:/hospital/upload/doctor/" + fileLoca + "/" + fileName);
		System.out.println("fileLoca : " + fileLoca);
		System.out.println("fileName : " + fileName);
		ResponseEntity<byte[]>result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
