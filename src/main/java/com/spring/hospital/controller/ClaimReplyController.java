package com.spring.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hospital.claimreply.service.IClaimReplyService;
import com.spring.hospital.command.ClaimReplyVO;

@Controller
@RequestMapping("/reply")
public class ClaimReplyController {
	
	@Autowired
	private IClaimReplyService service;
	
	//댓글 등록
	@ResponseBody
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ClaimReplyVO vo) {
		service.replyRegist(vo);
		return "regSuccess";
	}
	
	//페이징이 추가된 댓글 목록
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int bno, @PathVariable int pageNum) {
		
		List<ClaimReplyVO> list = service.getList(bno, pageNum);
		int total = service.getTotal(bno);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;		
	}
	
	//댓글 수정
	@PostMapping("/replyUpdate")
	public String replyUpdate(@RequestBody ClaimReplyVO vo) {
		//비밀번호 확인
		int result = service.pwCheck(vo);
		
		if(result == 1) {
			service.replyUpdate(vo);
			return "modSuccess";
		} else {
			return "pwFail";
		}
	}
	
	//댓글 삭제
	@PostMapping("/replyDelete")
	public String replyDelete(@RequestBody ClaimReplyVO vo) {
		
		if(service.pwCheck(vo) == 1) {
			service.replyDelete(vo.getRno());
			return "delSuccess";
		} else {
			return "pwFail";
		}
	}
}
