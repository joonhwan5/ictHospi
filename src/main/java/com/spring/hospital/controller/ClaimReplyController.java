package com.spring.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.hospital.claimreply.service.IClaimReplyService;
import com.spring.hospital.command.ClaimReplyVO;

@RestController
@RequestMapping("/reply")
public class ClaimReplyController {
	
	@Autowired
	private IClaimReplyService service;
	
	//댓글 등록
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
		service.replyUpdate(vo);
		return "modSuccess";
	}
	
	//댓글 삭제
	@PostMapping("/replyDelete")
	public String replyDelete(@RequestBody ClaimReplyVO vo) {
		service.replyDelete(vo.getRno());
		return "delSuccess";
	}
}
