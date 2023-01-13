package com.spring.hospital.news.mapper;

import java.util.List;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.util.PageVO;

public interface INewsMapper {

	// 글 등록
	void regist(NewsVO vo);
	
	// 글 목록
	List<NewsVO> getList(PageVO vo);
	
	// 총 게시물 수
	int getTotal(PageVO vo);
	
	// 상세보기
	NewsVO getContent(int bno);
	
	// 수정
	void update(NewsVO vo);
	
	// 삭제
	void delete(int bno);
	
	// 이전글 불러오기
	NewsVO getPrevContent(int bno);
	
	// 다음글 불러오기
	NewsVO getNextContent(int bno);
	
}
