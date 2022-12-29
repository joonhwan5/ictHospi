package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.notice.service.INoticeService;

@Controller
@RequestMapping("/notice")
public class noticeController {
	
	@Autowired
	private INoticeService service;
	
	@GetMapping("/noticeMain")
	public void noticeMain() {
		
	}
	
	@GetMapping("/noticeDetail")
	public void noticeDetail() {
		
	}
	
	@GetMapping("/noticeRegist")
	public void noticeRegist() {
		
	}
	
	@PostMapping("/noticeRegist")
	public String noticeRegist(@RequestBody NoticeVO vo) {
		service.regist(vo);
		
		return "board/noticeMain";
	}

}
