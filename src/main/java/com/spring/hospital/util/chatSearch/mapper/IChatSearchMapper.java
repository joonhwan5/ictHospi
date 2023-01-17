package com.spring.hospital.util.chatSearch.mapper;

import java.util.List;

import com.spring.hospital.command.ChatSearchVO;

public interface IChatSearchMapper {
	
	//검색어 테이블에서 자주하하는 질문 순으로 리스트를 불러오는 기능
	List<ChatSearchVO> getList();
	
	//검색어 관련 vo를 리스트로 받아오는 기능
	List<ChatSearchVO> getSearchList(String keyword);
}
