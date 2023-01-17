package com.spring.hospital.util.chatSearch.service;

import java.util.List;

import com.spring.hospital.command.ChatSearchVO;

public interface IChatSearchService {
	
	//검색어 테이블에서 리스트를 불러오는 기능
	List<ChatSearchVO> getList();

}
