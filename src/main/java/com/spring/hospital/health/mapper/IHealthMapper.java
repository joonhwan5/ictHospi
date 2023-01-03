package com.spring.hospital.health.mapper;

import java.util.List;

import com.spring.hospital.command.HealthVO;
import com.spring.hospital.util.PageVO;

public interface IHealthMapper {

	// 글 등록
	void regist(HealthVO vo);
	
	// 글 목록
	List<HealthVO> getList(PageVO vo);
	
	// 총 게시물 수
	int getTotal(PageVO vo);
	
	// 상세보기
	HealthVO getContent(int bno);
	
	// 수정
	void update(HealthVO vo);
	
	// 삭제
	void delete(int bno);
	
}