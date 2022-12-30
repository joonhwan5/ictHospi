package com.spring.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hospital.command.UserVO;
import com.spring.hospital.user.service.IUserService;
import com.spring.hospital.util.MailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSendService mailService;
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestBody String userId) {
		log.info("userId: " + userId);
		if(service.idCheckUsers(userId) == 0) {
			log.info("user쪽 통과!");
			if(service.idCheckAdmin(userId) == 0) {
				log.info("중복 안됨!");
				return "ok";
			} else {
				log.info("관리자쪽 중복!");
				return "false";
			}
		} else {
			log.info("users쪽 중복!");
			return "false";
		}
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}
	
	@PostMapping("/join")
	public String join(UserVO vo) {
		service.join(vo);
		return "redirect:/";
	}
}



















