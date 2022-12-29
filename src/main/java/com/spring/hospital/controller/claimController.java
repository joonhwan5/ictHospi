package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.claim.service.IClaimService;
import com.spring.hospital.command.ClaimVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/claim")
@Log4j
public class claimController {
	
	@Autowired
	private IClaimService service;
	
	@GetMapping("/claimMain")
	public void claimMain() {
		
	}
	
	@GetMapping("/claimDetail")
	public void claimDetail() {
		
	}
	
	@GetMapping("/claimRegist")
	public void claimRegist() {
		
	}
	
	@GetMapping("/claimModify")
	public void claimModify() {
		
	}
	
	//글 등록 처리
	@PostMapping("/claimRegist")
	public String regist(ClaimVO vo) {
		
		log.info("들어옴");
		service.regist(vo);
		return "claim/claimMain";
	}
	
	//글 수정 페이지 이동 처리
	@PostMapping("/claimModify")
	public void modify(@ModelAttribute("article") ClaimVO vo) {}
	
	//글 수정 처리
	@PostMapping("/claimUpdate")
	public String update(ClaimVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "reirect:/claim/claimDetail";
	}
	
	//글 삭제 처리
	@PostMapping("/claimDelete")
	public String delete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/claim/claimMain";
	}

}
