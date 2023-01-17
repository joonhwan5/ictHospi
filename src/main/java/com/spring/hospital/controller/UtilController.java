package com.spring.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.command.ChatSearchVO;
import com.spring.hospital.util.chatSearch.service.IChatSearchService;

@Controller
@RequestMapping("/util")
public class UtilController {
	
	@Autowired
	private IAdminService service;
	
	@Autowired
	private IChatSearchService chatService;
	
	@GetMapping("/popup")
	public void popup() {}
	
	@GetMapping("/ictChatBot")
	public void ictChatBot(Model model) {
		model.addAttribute("doctorList", service.getDoctorlistAdmin());
	}
	
	@PostMapping("/chatKeyword")
	@ResponseBody
	public List<ChatSearchVO> chatKeyword(@RequestBody String keyword) {
		System.out.println("Param(keyword): " + keyword);
		chatService.getSearchList(keyword);
		System.out.println("서비스가 가져온 키워드 리스트: ");
		System.out.println(chatService.getSearchList(keyword));
		
		
		return chatService.getSearchList(keyword);
	}
	
	@PostMapping("/searchFrequency")
	@ResponseBody
	public List<ChatSearchVO> searchFrequency(){
		return chatService.getList();
	}
	
}
