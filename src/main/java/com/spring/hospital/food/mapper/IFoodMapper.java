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
	
	//수정
	void update(FoodVO vo);
	
	//삭제
	void delete(int bno);

}
