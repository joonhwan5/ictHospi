package com.spring.hospital.claim.mapper;

import java.util.List;

import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.util.PageVO;

public interface IClaimMapper {
	
	//글 등록
	void regist(ClaimVO vo);
				
	//글 목록
	List<ClaimVO> getList(PageVO paging);
		
	//총 게시물 수
	int getTotal(PageVO vo);
		
	//상세보기
	ClaimVO getContent(int bno);
		
	//수정
	void update(ClaimVO vo);
		
	//삭제
	void delete(int bno);
	
	//조회수
	void viewCount(int bno);
	
	//이전 글 불러오기
	ClaimVO getPrevContent(int bno);
	
	//다음 글 불러오기
	ClaimVO getNextContent(int bno);

}
