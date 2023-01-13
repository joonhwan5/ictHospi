package com.spring.hospital.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSendService mailService;
	
	// id check
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestBody String userId) {
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
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(UserVO vo, String year, String month, String day, String domain, RedirectAttributes ra) {
		if(month.length() < 2) {
			if(day.length() < 2) {
				String birth = year + "0" + month + "0" + day;
				vo.setUserBirth1(birth);
			} else {
				String birth = year + "0" + month + day;
				vo.setUserBirth1(birth);
			}
		} else {
			if(day.length() < 2) {
				String birth = year + month + "0" + day;
				vo.setUserBirth1(birth);
			} else {
				String birth = year + month + day;
				vo.setUserBirth1(birth);
			}
		}
		String userEmail2 = "@" + domain;
		vo.setUserEmail2(userEmail2);
		service.join(vo);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/user/userLogin";
	}

	// 로그인
	@PostMapping("/login")
	public String login(UserVO vo, String referer, RedirectAttributes ra, HttpSession session, HttpServletResponse response) {
		
		UserVO user = service.userLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		AdminVO admin = service.adminLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		if(user != null) {
			return "redirect:" + referer;
		} else {
			if(admin != null) {
				return "redirect:" + referer;
			}
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			ra.addFlashAttribute("ref", referer);
			return "redirect:/user/userLogin";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		service.logout(session, request, response);
		return "redirect:/";
	}
	
	// 약관동의 이동
	@GetMapping("/userAgree")
	public void userAgree() {}
	
	// 회원가입 이동
	@RequestMapping("/userJoin")
	public void userJoin() {}
	
	// 로그인
	@GetMapping("/userLogin")
	public void userLogin(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		System.out.println("referer 경로: " + referer);
		model.addAttribute("referer", referer);
	}

}
















