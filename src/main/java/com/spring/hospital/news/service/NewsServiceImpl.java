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
	
	@Override
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}

	@Override
	public NewsVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update1(NewsVO vo) {
		mapper.update1(vo);
	}
	
	@Override
	public void update2(NewsVO vo) {
		mapper.update2(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
	
	@Override
	public NewsVO getPrevContent(int bno) {
		return mapper.getPrevContent(bno);
	}
	
	@Override
	public NewsVO getNextContent(int bno) {
		return mapper.getNextContent(bno);
	}

}
