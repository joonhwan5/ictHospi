package com.spring.hospital.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		service.join(vo);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(String loginId, String loginPw, RedirectAttributes ra, HttpSession session) {
		UserVO user = service.userLogin(loginId);
		AdminVO admin = service.adminLogin(loginId, loginPw);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(user != null) {
			if(encoder.matches(loginPw, user.getUserPw())) {
				session.setAttribute("login", user.getUserId());
				ra.addFlashAttribute("msg", "로그인 성공!!!");
				return "redirect:/";
			}
			ra.addFlashAttribute("msg", "로그인 또는 비밀번호가 틀렸습니다.");
			return "redirect:/";
		} else {
			if(admin != null) {
				session.setAttribute("admin", admin.getAdminId());
				ra.addFlashAttribute("msg", "로그인 성공!!!");
				return "redirect:/";
			}
			ra.addFlashAttribute("msg", "로그인 또는 비밀번호가 틀렸습니다.");
			return "redirect:/";
		}
	}
}



















