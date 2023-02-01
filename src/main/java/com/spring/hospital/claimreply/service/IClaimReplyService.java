package com.spring.hospital.claimreply.service;

import java.util.List;

import com.spring.hospital.command.ClaimReplyVO;

public interface IClaimReplyService {
	
	//댓글 등록
	void replyRegist(ClaimReplyVO vo);
	
	//목록 요청
	List<ClaimReplyVO> getList(int bno, int pageNum);
	
	//댓글 개수 (페이징 때문에 필요)
	int getTotal(int bno);
	
	//댓글 수정
	void replyUpdate(ClaimReplyVO vo);
	
	//댓글 삭제
	void replyDelete(int rno);

}
