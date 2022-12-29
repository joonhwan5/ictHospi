package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.news.service.INewsService;

@Controller
@RequestMapping("/news")
public class newsController {
	
	@Autowired
	private INewsService Service;
	
	// 병원 페이지 화면요청
	@GetMapping("newsMain")
	public void newsMain() {
		System.out.println("소식 메인 페이지 이동 요청(GET)");
	}
	
	// 글쓰기 요청
	/*
	 * @PostMapping("/regist") public String regist(NewsVO vo) { }
	 */

	@GetMapping("newsDetail")
	public void newsDetail() {

	}

	@GetMapping("healthMain")
	public void healthMain() {

	}

	@GetMapping("healthDetail")
	public void healthDetail() {

	}

	@GetMapping("newsRegist")
	public void newsRegist() {

	}
	
	@GetMapping("healthRegist")
	public void healthRegist() {
		
	}
	
	@GetMapping("newsModify")
	public void newsModify() {
		
	}
	
	@GetMapping("healthModify")
	public void healthModify() {
		
	}
}
