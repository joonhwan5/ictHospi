package com.spring.hospital.util.chatSearch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.ChatSearchVO;
import com.spring.hospital.util.chatSearch.mapper.IChatSearchMapper;

@Service
public class ChatSearchServiceImpl implements IChatSearchService {
	
	@Autowired
	private IChatSearchMapper mapper;
	
	@Override
	public List<ChatSearchVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<ChatSearchVO> getSearchList(String keyword) {
		mapper.getSearchList(keyword);
		return mapper.getSearchList(keyword);
	}

}
