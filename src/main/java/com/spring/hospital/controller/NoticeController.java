package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.notice.service.INoticeService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private INoticeService service;
	
	//목록 화면
	@GetMapping("/noticeMain")
	public void noticeMain(PageVO paging, Model model) {
		model.addAttribute("noticeList", service.getList(paging));
		model.addAttribute("pc", service.getPc(paging));
		System.out.println(service.getPc(paging));
	}
	
	//글 상세보기 페이지 이동
	@GetMapping("/noticeDetail/{bno}")
	public String noticeDetail(@PathVariable int bno, Model model,
							   @ModelAttribute("p") PageVO paging) {
		model.addAttribute("article", service.getContent(bno));
		return "notice/noticeDetail";
	}
	
	//글 쓰기 페이지 이동
	@GetMapping("/noticeRegist")
	public void noticeRegist() {
	
	}
	
	@GetMapping("/noticeDetail")
	public void noticeDetail() {
		
	}
	
	//글 수정 페이지 이동
	@GetMapping("/noticeModify")
	public void noticeModify() {
	
	}
	
	//글 등록 처리
	@PostMapping("/noticeRegist")
	public String noticeRegist(NoticeVO vo) {
		service.regist(vo);
		
		return "redirect:/notice/noticeMain";
	}
	
	//글 수정 처리
	@PostMapping("/noticeUpdate")
	public String update(NoticeVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/notice/noticeDetail";
	}
	
	//글 삭제 처리
	@PostMapping("/noticeDelete")
	public String delete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/notice/noticeMain";
	}

}
