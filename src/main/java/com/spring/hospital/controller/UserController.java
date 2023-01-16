package com.spring.hospital.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.hospital.command.AdminVO;
import com.spring.hospital.command.KakaoLoginVO;
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
	
	@Autowired
	private KakaoLoginVO kakaoLoginVO;
	
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
	
	// 로그인 페이지 이동
	@GetMapping("/userLogin")
	public void userLogin(HttpServletRequest request, Model model, HttpSession session) {
		String referer = request.getHeader("Referer");
		String kakaoAuthUrl = kakaoLoginVO.getAuthoriztionUrl(session);
		System.out.println("referer 경로: " + referer);
		model.addAttribute("referer", referer);
		model.addAttribute("urlKakao", kakaoAuthUrl);
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
	
	//카카오 로그인 성공시 redirect 되는 callback
	@GetMapping("/kakao_callback")
	public String callbackKakao(String code, String state, HttpSession session, RedirectAttributes ra, Model model,
								HttpServletRequest request) throws Exception {
		log.info("로그인 성공! callbackKakao 호출!");
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginVO.getAccessToken(code, state, session);
		log.info(oauthToken);
		
		//로그인 사용자 정보를 읽어온다.
		String apiResult = kakaoLoginVO.getUserProfile(oauthToken);
		log.info("사용자 정보: " + apiResult);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(apiResult);
		String kakaoAccount = jsonObject.get("kakao_account").toString();
		JSONObject kakaoEmail = (JSONObject) parser.parse(kakaoAccount);
		String email = kakaoEmail.get("email").toString();
		String birthday = kakaoEmail.get("birthday").toString();
		String userEmail1 = email.substring(0, email.indexOf("@"));
		String userEmail2 = "@" + email.substring(email.indexOf("@")+1);
		if(service.kakaoEmailCheck(userEmail1, userEmail2) != 1) {
			request.setAttribute("success", true);
			model.addAttribute("month", birthday.substring(0, 2));
			model.addAttribute("day", birthday.substring(2, 4));
			model.addAttribute("userEmail1", userEmail1);
			model.addAttribute("userEmail2", userEmail2);
			ra.addFlashAttribute("msg", "카카오 로그인에 성공하셨습니다! 회원가입을 해주세요.");
			return "redirect:/user/userJoin";
			
		}
		return "redirect:/";
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

}
















