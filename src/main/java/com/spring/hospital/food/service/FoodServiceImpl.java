package com.spring.hospital.food.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.FoodVO;
import com.spring.hospital.food.mapper.IFoodMapper;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

@Service
public class FoodServiceImpl implements IFoodService {
	
	@Autowired
	private IFoodMapper mapper;
	
	@Autowired
	private PageCreator pc;

	@Override
	public void regist(FoodVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<FoodVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}
	
	@Override
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}
	
	@Override
	public FoodVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update1(FoodVO vo) {
		mapper.update1(vo);
	}
	
	@Override
	public void update2(FoodVO vo) {
		mapper.update2(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);;
	}
	
	@Override
	public void viewCount(int bno) {
		mapper.viewCount(bno);
	}
	
	@Override
	public FoodVO getPrevContent(int bno) {
		return mapper.getPrevContent(bno);
	}
	
	@Override
	public FoodVO getNextContent(int bno) {
		return mapper.getNextContent(bno);
	}

}
