package com.spring.hospital.notice.service;

import java.util.List;

import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

public interface INoticeService {
	
	//글 등록
	void regist(NoticeVO vo);
		
	//글 목록
	List<NoticeVO> getList(PageVO vo);
	
	//총 게시물 수
	PageCreator getPc(PageVO vo);
	
	//상세보기
	NoticeVO getContent(int bno);
	
	//수정
	void update(NoticeVO vo);
	
	//삭제
	void delete(int bno);

}
