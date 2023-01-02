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
	public void update(FoodVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);;
	}

}
