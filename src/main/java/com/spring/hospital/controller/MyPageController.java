package com.spring.hospital.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.hospital.command.ReasonOfWithdrawalVO;
import com.spring.hospital.command.ReservationVO;
import com.spring.hospital.command.UserVO;
import com.spring.hospital.mypage.service.IMyPageService;
import com.spring.hospital.user.service.IUserService;
import com.spring.hospital.util.MailSendService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private IMyPageService service;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private MailSendService send;
	
	@GetMapping("/myPageMain")
	public void myPageMain(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("user", service.userInfo(id, model));
	}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {}
	
	// 회원정보수정
	@PostMapping("/userModify")
	public String userModify(UserVO vo, String year, String month, String day, String domain) {
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
		service.userUpdate(vo);
		return "redirect:/myPage/myPageMain";
	}
	
	// 회원 비밀번호 변경 이동
	@GetMapping("/userModifyPw")
	public void userModifyPw(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("id", id);
	}
	
	// 회원탈퇴 이동
	@GetMapping("/userWithdrawal")
	public void userWithdrawal(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("id", id);
	}
	
	// 탈퇴 비밀번호 확인
	@PostMapping("/userCheckPw")
	@ResponseBody
	public String userCheckPw(@RequestBody Map<String, String> data, Model model) {
		UserVO vo = service.userInfo(data.get("id"), model);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(data.get("pw"), vo.getUserPw())) {
			return "success";
		}
		
		return "fail";
	}
	
	// 회원탈퇴
	@PostMapping("/userWithdrawal")
	public String userWithdrawal(ReasonOfWithdrawalVO vo, HttpSession session, 
									HttpServletRequest request, HttpServletResponse response) {
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		service.reasonOfWithdrawal(vo);
		service.userDelete(vo.getUserId());
		
		if(loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}
		
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원비밀번호변경
	@PostMapping("/updatePw")
	public String updatePw(String oldPw, String newPw, String userId, RedirectAttributes ra,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		UserVO vo = service.updateUserPw(userId, oldPw, newPw);
		
		if(vo == null) {
			ra.addFlashAttribute("userModifyPwMsg", "현재 비밀번호를 틀렸습니다. 다시 입력해 주세요.");
			return "redirect:/myPage/userModifyPw";
		} else {
			userService.logout(session, request, response);
			ra.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 다시 로그인해주세요.");
			return "redirect:/user/userLogin";
		}
	}
	
	
	//예약 현황 페이지
	@GetMapping("/reservation")
	public void reservation(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("login");
		List<ReservationVO> list = service.getReserveList(userId);
		model.addAttribute("reserveList", list);
	}
	
	//예약 수정 페이지
	@GetMapping("/reservationModify/{reservNum}")
	public String reservationModify(@PathVariable int reservNum, Model model) {
		model.addAttribute("reservInfo", service.getReserveOne(reservNum));
		return "/myPage/reservationModify";
	}
	
	//예약 등록
	@PostMapping("/reservationRegist")
	public String reservationRegist(ReservationVO vo, RedirectAttributes ra, HttpSession session, Model model) {
		service.reserveRegist(vo);
		ra.addFlashAttribute("msg", "regist");
		String userId = (String)session.getAttribute("login");
		UserVO uvo = service.userInfo(userId, model);
		List<ReservationVO> list = service.getReserveList(userId);
		
		int largestReservationNo = 0;
		for(ReservationVO rvo : list) {
			largestReservationNo = largestReservationNo > rvo.getRvNo() ? largestReservationNo : rvo.getRvNo();
		}
		
		ReservationVO sendReservationVO = service.getReserveOne(largestReservationNo);
		send.reserveCompleteEmail(uvo.getUserEmail1()+"@"+uvo.getUserEmail2(), uvo.getUserName(), sendReservationVO, "complete");
		return "redirect:/myPage/reservation";
	}
	
	//예약 수정
	@PostMapping("/modifyReservation")
	public String modifyReservation(ReservationVO vo, RedirectAttributes ra, HttpSession session, Model model) {
		UserVO uvo = service.userInfo((String)session.getAttribute("login"), model);
		service.reservModify(vo);
		send.reserveCompleteEmail(uvo.getUserEmail1()+"@"+uvo.getUserEmail2(), uvo.getUserName(), vo, "update");
		ra.addFlashAttribute("msg", "modify");
		return "redirect:/myPage/reservation";
	}
	
	//예약 취소
	@GetMapping("/reservationDelete/{reservNum}")
	public String reservationDelete(@PathVariable int reservNum, HttpSession session, Model model) {
		UserVO uvo = service.userInfo((String)session.getAttribute("login"), model);
		ReservationVO vo = service.getReserveOne(reservNum);
		service.delete(reservNum);
		send.reserveCompleteEmail(uvo.getUserEmail1()+"@"+uvo.getUserEmail2(), uvo.getUserName(), vo, "remove");
		return "redirect:/myPage/reservation";
	}
	
	//예약 가능 시간
	@PostMapping("/getTime")
	@ResponseBody
	public List<String> getTime(@RequestBody String rvDate) {
		
		List<String> timeList = service.getTime(rvDate);
		
		return timeList;
	}
	
	//달력
	@ResponseBody
	@PostMapping("/getCalendar")
	public List<String> getCalendar(@RequestBody Map<String, Integer> data) {
		
		int year = data.get("year");
		int month = data.get("month");

		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		
		
		start.set(year, month-1, 1);
		end.set(year, month, 1);
		 
		end.add(Calendar.DATE, -1);
		
		int startDayOfWeek = start.get(Calendar.DAY_OF_WEEK);
		int endDay = end.get(Calendar.DATE);
		
		start.add(Calendar.DATE, -1);
		
		int endDayOfPreMonth = start.get(Calendar.DATE);
		
		List<String> list = new ArrayList<String>();
		for(int i = (endDayOfPreMonth - startDayOfWeek) + 2; i <= endDayOfPreMonth; i++) {
			if(month != 1) {
				list.add(year + "." + (month-1) + "." + Integer.toString(i));				
			} else {
				list.add((year-1) + ".12." + Integer.toString(i));
			}
		}
		for(int i = 1; i<= endDay; i++) {
			list.add(year + "." + month + "." + Integer.toString(i));
		}
		for(int i = 1; list.size() <= 42; i++) {
			if(month != 12) {
				list.add(year + "." + (month+1) + "." + Integer.toString(i));				
			} else {
				list.add((year+1) + ".1." + Integer.toString(i));
			}
		}
		return list;
	}
	
}




















