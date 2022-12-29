package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.claim.service.IClaimService;
import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.notice.service.INoticeService;

@Controller
@RequestMapping("/board")
public class boardController {
	
	@Autowired
	private INoticeService noticeservice;
	
	@Autowired
	private IClaimService claimservice;
	
	@GetMapping("/noticeMain")
	public void noticeMain() {
		
	}
	
	@GetMapping("/noticeDetail")
	public void noticeDetail() {
		
	}
	
	@GetMapping("/noticeRegist")
	public void noticeRegist() {
		
	}
	
	@GetMapping("/boardClaim")
	public void boardClaim() {
		
	}
	
	@GetMapping("/claimDetail")
	public void claimDetail() {
		
	}
	
	@GetMapping("/boardFood")
	public void boardFood() {
		
	}
	
	@GetMapping("/foodDetail")
	public void foodDetail() {
		
	}
	
	@PostMapping("/noticeRegist")
	public String noticeRegist(@RequestBody NoticeVO vo) {
		noticeservice.noticeRegist(vo);
		
		return "board/noticeMain";
	}
	
	@PostMapping("/claimRegist")
	public String claimRegist(@RequestBody ClaimVO vo) {
		claimservice.claimRegist(vo);
		
		return "board/noticeMain";
	}

}
