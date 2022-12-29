package com.spring.hospital.doctorReply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.DoctorReplyVO;
import com.spring.hospital.doctorReply.mapper.IDoctorReplyMapper;
import com.spring.hospital.util.PageVO;

@Service
public class DoctorReplyServiceImpl implements IDoctorReplyService {
	
	@Autowired
	private IDoctorReplyMapper mapper;

	@Override
	public void replyRegist(DoctorReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<DoctorReplyVO> getList(int doctorNo, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum); //화면에서 전달된 페이지 번호
		vo.setCpp(5); //댓글은 한 화면에 5개씩
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);//페이징 쿼리를 위한 pageNum과 cpp
		data.put("doctorNo", doctorNo);//어느 의사의 댓글 목록인지를 전달하기 위한 정보
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int doctorNo) {
		return mapper.getTotal(doctorNo);
	}

	@Override
	public void replyUpdate(DoctorReplyVO vo) {
		

	}

	@Override
	public void replyDelete(int rno) {
		// TODO Auto-generated method stub

	}

}
