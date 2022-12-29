package com.spring.hospital.claim.service;

import java.util.List;

import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

public interface IClaimService {
	
	//글 등록
	void regist(ClaimVO vo);
		
	//글 목록
	List<ClaimVO> getList(PageVO vo);
	
	//총 게시물 수
	PageCreator getPc(PageVO vo);
	
	//상세보기
	ClaimVO getContent(int bno);
	
	//수정
	void update(ClaimVO vo);
	
	//삭제
	void delete(int bno);

}
