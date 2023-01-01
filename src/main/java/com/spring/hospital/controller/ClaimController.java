package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.claim.service.IClaimService;
import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/claim")
public class ClaimController {
	
	@Autowired
	private IClaimService service;
	
	//목록 화면
	@GetMapping("/claimMain")
	public void claimMain(PageVO paging, Model model) {
		model.addAttribute("boardList", service.getList(paging));
		model.addAttribute("pc", service.getPc(paging));
	}
	
	//글 상세보기 페이지 이동
	@GetMapping("/claimDetail")
	public void claimDetail() {
		
	}
	
	//글 쓰기 화면 이동
	@GetMapping("/claimRegist")
	public void claimRegist() {
		
	}
	
	//글 수정 화면 이동
	@GetMapping("/claimModify")
	public void claimModify() {
		
	}
	
	//글 등록 처리
	@PostMapping("/claimRegist")
	public String regist(@RequestBody ClaimVO vo) {
		service.regist(vo);
		return "claim/claimMain";
	}
	
	//글 수정 처리
	@PostMapping("/claimUpdate")
	public String update(ClaimVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/claim/claimDetail";
	}
	
	//글 삭제 처리
	@PostMapping("/claimDelete")
	public String delete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/claim/claimMain";
	}

}
