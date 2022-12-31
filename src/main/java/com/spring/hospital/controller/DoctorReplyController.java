package com.spring.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.hospital.command.DoctorReplyVO;
import com.spring.hospital.doctorReply.service.IDoctorReplyService;

@RestController
@RequestMapping("/replyDoctor")
public class DoctorReplyController {

	@Autowired
	private IDoctorReplyService service;
	
	//댓글 등록
	@PostMapping("/replyRegist")
	public String replyDoctorRegist(@RequestBody DoctorReplyVO vo) {
		
		service.replyRegist(vo);
		
		return "regSuccess";
	}
	
	//페이징이 추가된 댓글 목록
	@GetMapping("/getList/{doctorNo}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int doctorNo, @PathVariable int pageNum) {
		List<DoctorReplyVO> list = service.getList(doctorNo, pageNum);//댓글 목록 데이터
		int total = service.getTotal(doctorNo);//현재 사용자가 요청한 글의 전체 댓글 개수
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);		
		return map;
	}
	
	//댓글 수정
	
	
	
	//댓글 삭제
	
	
	
	
	
	
	
	
	
	
}
