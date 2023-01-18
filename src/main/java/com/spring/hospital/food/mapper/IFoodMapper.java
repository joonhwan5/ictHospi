package com.spring.hospital.food.mapper;

import java.util.List;

import com.spring.hospital.command.FoodVO;
import com.spring.hospital.util.PageVO;

public interface IFoodMapper {
	
	//글 등록
	void regist(FoodVO vo);
	
	//글 목록
	List<FoodVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	FoodVO getContent(int bno);
	
	//제목만 수정
	void update1(FoodVO vo);
	
	//제목, 사진 수정
	void update2(FoodVO vo);
	
	//삭제
	void delete(int bno);
	
	//조회수
	void viewCount(int bno);
	
	//이전 글 불러오기
	FoodVO getPrevContent(int bno);
	
	//다음 글 불러오기
	FoodVO getNextContent(int bno);

}
