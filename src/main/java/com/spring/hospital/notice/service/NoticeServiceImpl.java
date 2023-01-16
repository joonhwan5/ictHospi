package com.spring.hospital.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.NoticeVO;
import com.spring.hospital.notice.mapper.INoticeMapper;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Autowired
	private INoticeMapper mapper;
	@Autowired
	private PageCreator pc;

	@Override
	public void regist(NoticeVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<NoticeVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		System.out.println(" + 총 수: " + mapper.getTotal(vo));
		return pc;
	}

	@Override
	public NoticeVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(NoticeVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
	
	@Override
	public void viewCount(int bno) {
		mapper.viewCount(bno);
	}
	
	@Override
	public NoticeVO getPrevContent(int bno) {
		return mapper.getPrevContent(bno);
	}
	
	@Override
	public NoticeVO getNextContent(int bno) {
		return mapper.getNextContent(bno);
	}

}
