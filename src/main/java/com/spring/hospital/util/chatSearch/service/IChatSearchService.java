package com.spring.hospital.util.chatSearch.service;

import java.util.List;

import com.spring.hospital.command.ChatSearchVO;

public interface IChatSearchService {
	
	//검색어 테이블에서 자주하하는 질문 순으로 리스트를 불러오는 기능
	List<ChatSearchVO> getList();
	
	//검색어 관련 vo를 리스트로 받아오는 기능
	List<ChatSearchVO> getSearchList(String keyword);

	//검색어 조회수 올리기
	void hitUp(String keyword);

	//사진 이름 가져오기
	String getFileName(String fileName);
}
