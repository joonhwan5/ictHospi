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

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private IMyPageService service;
	
	@GetMapping("/myPageMain")
	public void myPageMain(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("user", service.userInfo(id));
	}
	
	@GetMapping("/reservation")
	public void reservation(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("login");
		List<ReservationVO> list = service.getReserveList(userId);
		model.addAttribute("reserveList", list);
	}
	
	@GetMapping("/reservationDelete/{reservNum}")
	public String reservationDelete(@PathVariable int reservNum) {
		service.delete(reservNum);
		return "redirect:/myPage/reservation";
	}
	
	@GetMapping("/adminPageMain")
	public void adminPageMain() {}
	
	@PostMapping("/userModify")
	public String userModify(UserVO vo) {
		service.userUpdate(vo);
		return "redirect:/myPage/myPageMain";
	}
	
	@GetMapping("/userWithdrawal")
	public void userWithdrawal(HttpSession session, Model model) {
		String id = (String) session.getAttribute("login");
		model.addAttribute("id", id);
	}
	
	// 회원탈퇴
	@PostMapping("/userWithdrawal")
	public String userWithdrawal(ReasonOfWithdrawalVO vo, HttpSession session, 
									HttpServletRequest request, HttpServletResponse response) {
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		service.reasonOfWithdrawal(vo);
		service.userDelete(vo.getUserId());
		
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		
		session.invalidate();
		return "redirect:/";
	}

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
	
	@PostMapping("/getTime")
	@ResponseBody
	public List<String> getTime(@RequestBody Map<String, String> data1) {
		
		String doctorName = data1.get("doctorName");
		String rvDate = data1.get("rvDate");
		
		System.out.println(doctorName);
		System.out.println(rvDate);
		
		
		List<String> timeList = service.getTime(data1);
		
		return timeList;
	}
	
	@GetMapping("/reservationModify/{reservNum}")
	public String reservationModify(@PathVariable int reservNum, Model model) {
		model.addAttribute("reservInfo", service.getReserveOne(reservNum));
		return "/myPage/reservationModify";
	}
	
	@PostMapping("/reservationRegist")
	public String reservationRegist(ReservationVO vo, RedirectAttributes ra) {
		service.reserveRegist(vo);
		ra.addFlashAttribute("msg", "regist");
		return "redirect:/myPage/reservation";
	}
	
	@PostMapping("/modifyReservation")
	public String modifyReservation(ReservationVO vo, RedirectAttributes ra) {
		service.reservModify(vo);
		ra.addFlashAttribute("msg", "modify");
		return "redirect:/myPage/reservation";
	}
	
	@ResponseBody
	@PostMapping("/getPickupCount")
	public List<Integer> getPickupCount(@RequestBody String rvDate) {
		System.out.println(rvDate);
		List<Integer> list = service.getPickupCount(rvDate);
		return list;
	}
}




















