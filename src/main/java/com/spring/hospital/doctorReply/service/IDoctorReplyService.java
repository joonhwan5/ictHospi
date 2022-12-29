package com.spring.hospital.doctorReply.service;

import java.util.List;

import com.spring.hospital.command.DoctorReplyVO;

public interface IDoctorReplyService {

	//댓글 등록
	void replyRegist(DoctorReplyVO vo);
	
	//목록 요청
	List<DoctorReplyVO> getList(int doctorNo, int pageNum);
	
	//댓글 개수 (페이징 때문에 필요)
	int getTotal(int doctorNo);
	
	//댓글 수정
	void replyUpdate(DoctorReplyVO vo);
	
	//댓글 삭제
	void replyDelete(int rno);

	
	
}
