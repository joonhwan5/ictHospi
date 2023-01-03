package com.spring.hospital.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.AdminVO;
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
	
	/* id check */
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestBody String userId) {
		log.info("userId: " + userId);
		if(service.idCheckUsers(userId) == 0) {
			if(service.idCheckAdmin(userId) == 0) {
				return "ok";
			} else {
				return "false";
			}
		} else {
			return "false";
		}
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		service.join(vo);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/";
	}

	// 로그인
	@PostMapping("/login")
	public String login(UserVO vo, RedirectAttributes ra, HttpSession session, HttpServletResponse response) {
		
		UserVO user = service.userLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		AdminVO admin = service.adminLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		
		System.out.println("user: " + user);
		System.out.println("admin: " + admin);
		if(user != null) {
			return "redirect:/";
		} else {
			if(admin != null) {
				return "redirect:/";
			}
			ra.addFlashAttribute("msg", "로그인 또는 비밀번호가 틀렸습니다.");
			return "redirect:/";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		service.logout(session, request, response);
		return "redirect:/";
	}
}



















