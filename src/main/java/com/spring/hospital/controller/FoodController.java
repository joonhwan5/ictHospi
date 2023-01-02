package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.command.FoodVO;
import com.spring.hospital.food.service.IFoodService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/food")
public class FoodController {
	
	@Autowired
	private IFoodService service;
	
	//목록 화면
	@GetMapping("/foodMain")
	public void foodMain(PageVO paging, Model model) {
		model.addAttribute("foodList", service.getList(paging));
		model.addAttribute("pc", service.getPc(paging));
		System.out.println(service.getPc(paging));
	}
	
	//글 등록 페이지 이동
	@GetMapping("/foodRegist")
	public void foodRegist() {
		System.out.println("글쓰기 페이지 요청: GET");
	}
	
	//글 등록 처리
	@PostMapping("/foodRegist")
	public String foodRegist(FoodVO vo) {
		service.regist(vo);
		return "redirect:/food/foodMain";
	}
	
	//글 상세보기 피이지 이동
	@GetMapping("/foodDetail/{bno}")
	public String foodDetail(@PathVariable int bno, Model model,
							 @ModelAttribute("p") PageVO paging) {
		model.addAttribute("article", service.getContent(bno));
		return "food/foodDetail";
	}
	
	//글 수정 화면 이동
	@PostMapping("/foodModify")
	public void foodModify(@ModelAttribute("article") FoodVO vo) {
		
	}
	
	//글 수정 처리
	@PostMapping("/foodUpdate")
	public String update(FoodVO vo) {
		service.update(vo);
		return "redirect:/food/foodMain/" + vo.getBno();
	}
	
	//글 삭제 처리
	@PostMapping("/foodDelete")
	public String foodDelete(int bno) {
		service.delete(bno);
		return "redirect:/food/foodMain";
	}
	
}
