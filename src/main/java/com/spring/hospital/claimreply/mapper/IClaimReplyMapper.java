package com.spring.hospital.claimreply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.hospital.command.ClaimReplyVO;

public interface IClaimReplyMapper {
	
	//댓글 등록
	void replyRegist(ClaimReplyVO vo);
	
	//목록 요청
	List<ClaimReplyVO> getList(Map<String, Object> data);
	
	//댓글 개수 (페이징 때문에 필요)
	int getTotal(int bno);
	
	//비밀번호 확인
	int pwCheck(ClaimReplyVO vo);
	
	//댓글 수정
	void replyUpdate(ClaimReplyVO vo);
	
	//댓글 삭제
	void replyDelete(int rno);

}
