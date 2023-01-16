package com.spring.hospital.notice.mapper;

import java.util.List;

import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.util.PageVO;

public interface INoticeMapper {
	
	//글 등록
	void regist(NoticeVO vo);
			
	//글 목록
	List<NoticeVO> getList(PageVO vo);
		
	//총 게시물 수
	int getTotal(PageVO vo);
		
	//상세보기
	NoticeVO getContent(int bno);
		
	//수정
	void update(NoticeVO vo);
		
	//삭제
	void delete(int bno);
	
	//조회수
	void viewCount(int bno);
	
	//이전 글 불러오기
	NoticeVO getPrevContent(int bno);
	
	//다음 글 불러오기
	NoticeVO getNextContent(int bno);

}
