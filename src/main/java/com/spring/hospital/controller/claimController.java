package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.claim.service.IClaimService;
import com.spring.hospital.command.ClaimVO;

@Controller
@RequestMapping("/board")
public class claimController {
	
	@Autowired
	private IClaimService service;
	
	@GetMapping("/boardClaim")
	public void boardClaim() {
		
	}
	
	@GetMapping("/claimDetail")
	public void claimDetail() {
		
	}
	
	@PostMapping("/claimRegist")
	public String regist(@RequestBody ClaimVO vo) {
		service.regist(vo);
		
		return "board/boardClaim";
	}

}
