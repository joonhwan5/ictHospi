package com.spring.hospital.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.claim.service.IClaimService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/claim")
public class ClaimController {
	
	@Autowired
	private IClaimService service;
	
	//목록 화면
	@GetMapping("/claimMain")
	public void claimMain(PageVO paging, Model model) {
		model.addAttribute("claimList", service.getList(paging));
		model.addAttribute("pc", service.getTotal(paging));
	}
	
	// 글 등록 페이지 이동
	@GetMapping("/claimRegist")
	public void claimRegist() {}

	// 글 등록 처리
	@PostMapping("/claimRegist")
	public String claimRegist(ClaimVO vo) {
		service.regist(vo);
		return "redirect:/claim/claimMain";
	}
	
	//글 상세보기 페이지 이동
	@GetMapping("/claimDetail/{bno}")
	public String claimDetail(@PathVariable int bno, Model model,
							  @ModelAttribute("p") PageVO paging,
							  HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("article", service.getContent(bno));
		model.addAttribute("articlePrev", service.getPrevContent(bno));
		model.addAttribute("articleNext", service.getNextContent(bno));
		
		String number = Integer.toString(bno);
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			if(cookie.getName().equals("visit")) {
				visitor = 1;
				if(cookie.getValue().contains(number)) {
					
				} else {
					cookie.setValue(cookie.getValue() + "_" + number);
					response.addCookie(cookie);
					service.viewCount(bno);
				}
			}
		}
		if(visitor == 0) {
			Cookie newCookie = new Cookie("visit", number);
			response.addCookie(newCookie);
			service.viewCount(bno);
		}
		return "claim/claimDetail";
	}
	
	//글 수정 화면 이동
	@PostMapping("/claimModify")
	public void claimModify(@ModelAttribute("article") ClaimVO vo) {
		
	}
	
	//글 수정 처리
	@PostMapping("/claimUpdate")
	public String update(ClaimVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/claim/claimDetail/" + vo.getBno();
	}
	
	//글 삭제 처리
	@PostMapping("/claimDelete")
	public String delete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/claim/claimMain";
	}

}
