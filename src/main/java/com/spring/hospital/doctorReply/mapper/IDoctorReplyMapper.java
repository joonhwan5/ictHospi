package com.spring.hospital.doctorReply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.hospital.command.DoctorReplyVO;

public interface IDoctorReplyMapper {

	//댓글 등록
	void replyRegist(DoctorReplyVO vo);
	
	//목록 요청
	List<DoctorReplyVO> getList(Map<String, Object> data);
	
	//댓글 개수 (페이징 때문에 필요)
	int getTotal(int doctorNo);
	
	//댓글 수정
	void replyUpdate(DoctorReplyVO vo);
	
	//댓글 삭제
	void replyDelete(int rno);
		
	
}
