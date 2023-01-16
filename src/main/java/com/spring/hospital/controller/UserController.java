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
	
	// 카카오 회원가입
	@PostMapping("/kakaoJoin")
	public String kakaoJoin(UserVO vo, String year, String month, String day, String kakaoEmail, RedirectAttributes ra, HttpSession session) {
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
		
		String userEmail1 = kakaoEmail.substring(0, kakaoEmail.lastIndexOf("@"));
		String userEmail2 = "@" + kakaoEmail.substring(kakaoEmail.lastIndexOf("@") + 1);
		vo.setUserEmail1(userEmail1);
		vo.setUserEmail2(userEmail2);
		vo.setUserPw("0000");
		service.kakaoJoin(vo);
		
		session.removeAttribute("kakaoId");
		session.removeAttribute("kakaoEmail");
		
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
	public String callbackKakao(String code, String state, HttpSession session, RedirectAttributes ra) throws Exception {
		
		log.info("로그인 성공! callbackKakao 호출!");
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginVO.getAccessToken(code, state, session);
		log.info(oauthToken);
		
		//로그인 사용자 정보를 읽어온다.
		String apiResult = kakaoLoginVO.getUserProfile(oauthToken);
		log.info("사용자 정보: " + apiResult);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(apiResult);
		String kakaoId = jsonObject.get("id").toString();
		String kakaoAccount = jsonObject.get("kakao_account").toString();
		JSONObject kakaoEmail = (JSONObject) parser.parse(kakaoAccount);
		String email = kakaoEmail.get("email").toString();
		
		session.setAttribute("kakaoId", kakaoId);
		session.setAttribute("kakaoEmail", email);
		
		System.out.println("아이디 체크: " + idCheck(idCheck(kakaoId)));
		
		if(idCheck(kakaoId).equals("ok")) {
			ra.addFlashAttribute("msg", "카카오 로그인에 성공하셨습니다! 회원가입을 해주세요.");
			session.setAttribute("kakaoId", kakaoId);
			session.setAttribute("kakaoEmail", email);
			return "redirect:/user/userAgree";
		} else {
			session.setAttribute("kakao", "kakao");
			session.setAttribute("login", kakaoId);
			return "redirect:/";
		}
		
	}
	
	// 로그아웃
	@GetMapping("/userLogout")
	public String logout(String state, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("로그아웃 redirect 호출!");
		service.logout(session, request, response);
		return "redirect:/";
	}
	
	// 약관동의 이동
	@GetMapping("/userAgree")
	public void userAgree() {}
	
	// 회원가입 이동
	@RequestMapping("/userJoin")
	public void userJoin() {}
	
	// 카카오 회원가입 이동
	@RequestMapping("/kakaoUserJoin")
	public void kakaoUserJoin() {}

}
















