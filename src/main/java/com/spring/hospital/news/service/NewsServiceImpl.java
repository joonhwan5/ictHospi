package com.spring.hospital.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.news.mapper.INewsMapper;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

@Service
public class NewsServiceImpl implements INewsService {

	@Autowired
	private INewsMapper mapper;
	
	@Autowired
	private PageCreator pc;
	
	@Override
	public void regist(NewsVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<NewsVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}
	
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}

	@Override
	public int getTotal(PageVO vo) {
		return 0;
	}

	@Override
	public NewsVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(NewsVO vo) {

	}

	@Override
	public void delete(int bno) {

	}

}
