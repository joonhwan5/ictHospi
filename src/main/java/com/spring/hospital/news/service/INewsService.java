package com.spring.hospital.news.service;

import java.util.List;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

public interface INewsService {

	// 글 등록
	void regist(NewsVO vo);
	
	// 글 목록
	List<NewsVO> getList(PageVO vo);
	
	// 총 게시물 수
	PageCreator getPc(PageVO vo);
	
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
