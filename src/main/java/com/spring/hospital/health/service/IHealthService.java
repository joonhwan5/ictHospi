package com.spring.hospital.health.service;

import java.util.List;

import com.spring.hospital.command.HealthVO;
import com.spring.hospital.command.NewsVO;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

public interface IHealthService {

	// 글 등록
	void regist(HealthVO vo);

	// 글 목록
	List<HealthVO> getList(PageVO vo);

	// 총 게시물 수
	PageCreator getPc(PageVO vo);

	// 상세보기
	HealthVO getContent(int bno);

	// 게시글 제목 수정
	void update1(HealthVO vo);

	// 사진 게시글 제목 수정
	void update2(HealthVO vo);

	// 삭제
	void delete(int bno);

	// 이전글 불러오기
	HealthVO getPrevContent(int bno);

	// 다음글 불러오기
	HealthVO getNextContent(int bno);
}
