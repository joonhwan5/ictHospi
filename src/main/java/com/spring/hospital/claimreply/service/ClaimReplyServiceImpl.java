package com.spring.hospital.claimreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.claimreply.mapper.IClaimReplyMapper;
import com.spring.hospital.command.ClaimReplyVO;
import com.spring.hospital.util.PageVO;

@Service
public class ClaimReplyServiceImpl implements IClaimReplyService {

	@Autowired
	private IClaimReplyMapper mapper;
	
	@Override
	public void replyRegist(ClaimReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ClaimReplyVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(5);
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo); //페이징 쿼리를 위한 pageNum과 cpp
		data.put("bno", bno); //몇 번 글의 댓글 목록인지를 전달하기 위한 정보.
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}
	
	@Override
	public int pwCheck(ClaimReplyVO vo) {
		return mapper.pwCheck(vo);
	}

	@Override
	public void replyUpdate(ClaimReplyVO vo) {
		mapper.replyUpdate(vo);
	}

	@Override
	public void replyDelete(int rno) {
		mapper.replyDelete(rno);
	}

}
