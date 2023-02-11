package com.spring.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
		
		if(!kakaoEmail.equals("")) {
			String userEmail1 = kakaoEmail.substring(0, kakaoEmail.lastIndexOf("@"));
			String userEmail2 = kakaoEmail.substring(kakaoEmail.lastIndexOf("@"));
			vo.setUserEmail1(userEmail1);
			vo.setUserEmail2(userEmail2);
			session.removeAttribute("kakaoEmail");
		} else {
			String userEmail2 = "@" +vo.getUserEmail2();
			vo.setUserEmail2(userEmail2);
		}
		
		vo.setUserPw("0000");
		service.kakaoJoin(vo);
		session.invalidate();
		
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/user/userLogin";
	}
	
	// 로그인 페이지 이동
	@GetMapping("/userLogin")
	public void userLogin(HttpServletRequest request, Model model, HttpSession session) {
		String referer = request.getHeader("Referer");
		String kakaoAuthUrl = kakaoLoginVO.getAuthoriztionUrl(session);
		if(referer == null) {
			referer = "http://localhost/";
		}
		kakaoAuthUrl += "&prompt=login";
		model.addAttribute("referer", referer);
		model.addAttribute("urlKakao", kakaoAuthUrl);
	}

	// 로그인
	@PostMapping("/login")
	public String login(UserVO vo, String referer, RedirectAttributes ra, HttpSession session, HttpServletResponse response) {
		UserVO user = service.userLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		AdminVO admin = service.adminLogin(vo.getUserId(), vo.getUserPw(), vo.isAutoLogin(), session, response);
		
		if(user != null) {
			if(session.getAttribute("accessToken") != null) {
				session.removeAttribute("kakaoId");
				session.removeAttribute("kakaoEmail");
				session.removeAttribute("kakao");
				session.removeAttribute("noKakaoEmail");
				session.removeAttribute("accessToken");
			}
			return "redirect:" + referer;
		} else {
			if(admin != null) {
				if(session.getAttribute("accessToken") != null) {
					session.removeAttribute("kakaoId");
					session.removeAttribute("kakaoEmail");
					session.removeAttribute("kakao");
					session.removeAttribute("noKakaoEmail");
					session.removeAttribute("accessToken");
				}
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
		
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginVO.getAccessToken(code, state, session);
		session.setAttribute("accessToken", oauthToken); // accessToken 생성
		
		//로그인 사용자 정보를 읽어온다
		String apiResult = kakaoLoginVO.getUserProfile(oauthToken);
		log.info("사용자 정보:" + apiResult);
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObject = (JSONObject) parser.parse(apiResult);
		String kakaoId = jsonObject.get("id").toString();
		
		String properties = jsonObject.get("properties").toString();
		JSONObject nickName = (JSONObject) parser.parse(properties);
		String nick = nickName.get("nickname").toString();
		
		String kakaoAccount = jsonObject.get("kakao_account").toString();
		System.out.println("kakaoAccount: " + kakaoAccount);
		JSONObject kakaoEmail = (JSONObject) parser.parse(kakaoAccount);
		if(kakaoEmail.get("email") != null) { // 카카오 이메일 동의
			String email = kakaoEmail.get("email").toString();
			
			if(idCheck(nick).equals("ok")) { // 카카오 회원가입 필수
				ra.addFlashAttribute("카카오 로그인 성공! 회원가입은 필수입니다.");
				session.setAttribute("kakaoId", nick);
				session.setAttribute("kakaoEmail", email);
				session.setAttribute("kakao", "kakao");
				return "redirect:/user/userAgree";
			} else {
				session.setAttribute("kakao", "kakao");
				session.setAttribute("kakaoLogout", kakaoId);
				session.setAttribute("login", nick);
				return "redirect:/";
			}
		} else { // 카카오 이메일 비동의
			if(idCheck(nick).equals("ok")) { // 카카오 회원가입 필수
				ra.addFlashAttribute("카카오 로그인 성공! 회원가입은 필수입니다.");
				session.setAttribute("kakaoId", nick);
				session.setAttribute("kakao", "kakao");
				session.setAttribute("noKakaoEmail", "noKakaoEmail");
				return "redirect:/user/userAgree";
			} else {
				session.setAttribute("kakao", "kakao");
				session.setAttribute("kakaoLogout", kakaoId);
				session.setAttribute("login", nick);
				return "redirect:/";
			}
		}
		
	}
	
	// 로그아웃
	@GetMapping("/userLogout")
	public String logout(String state, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(session.getAttribute("accessToken") != null) {
			OAuth2AccessToken oauthToken = (OAuth2AccessToken) session.getAttribute("accessToken");
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(kakaoLoginVO.getLogoutAuthoriztionUrl(oauthToken).toString());
			
			if(session.getAttribute("kakaoLogout") != null) {
				String logoutKakaoId = jsonObject.get("id").toString();
				String kakaoLogout = (String) session.getAttribute("kakaoLogout");
				
				if(logoutKakaoId.equals(kakaoLogout)) {
					session.invalidate();
					return "redirect:/";
				} else {
					return "redirect:/";
				}
			} else {
				session.invalidate();
				return "redirect:/";
			}
			
		} else {
			service.logout(session, request, response);
			System.out.println("휴우");
			return "redirect:/";
		}
		
	}
	
	// 약관동의 이동
	@GetMapping("/userAgree")
	public void userAgree() {}
	
	// 회원가입 이동
	@RequestMapping("/userJoin")
	public void userJoin() {}
	
	// 카카오 회원가입 이동 (이메일 정보 비동의)
	@RequestMapping("/kakaoUserJoin")
	public void kakaoUserJoin() {}
	
	// 카카오 회원가입 이동 (이메일 정보 동의)
	@RequestMapping("/kakaoUserChooseJoin")
	public void kakaoUserChoooseJoin() {}
	
	// 아이디 찾기 이동
	@GetMapping("/userFindId")
	public void userFindId() {}
	
	// 아이디 찾기 이메일값 받기
	@PostMapping("/findId")
	@ResponseBody
	public List<UserVO> findId(@RequestBody String email) {
		String email1 = email.substring(0, email.lastIndexOf("@"));
		String email2 = email.substring(email.lastIndexOf("@"));
		List<UserVO> user = service.userFindId(email1, email2);
		
		return user;
	}
	
	// 비밀번호 찾기 이동
	@GetMapping("/userFindPw")
	public void userFindPw() {}
	
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public String findPw(String id, String email, RedirectAttributes ra) {
		UserVO user = service.userFindPw(id, email);
		if(user != null) {
			String password = mailService.userFindPwEmail(email);
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String temporaryPw = encoder.encode(password);
			
			service.userUpdatePw(user.getUserId(), temporaryPw);
			
			ra.addFlashAttribute("msg", "입력하신 이메일로 임시 비밀번호를 보냈습니다.");
			return "redirect:/user/userLogin";
		} else {
			
			ra.addFlashAttribute("msg", "아이디 혹은 이메일 주소가 틀렸습니다.");
			return "redirect:/user/userFindPw";
		}
	}
}
















