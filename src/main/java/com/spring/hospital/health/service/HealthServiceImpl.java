package com.spring.hospital.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.HealthVO;
import com.spring.hospital.health.mapper.IHealthMapper;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

@Service
public class HealthServiceImpl implements IHealthService {

	@Autowired
	private IHealthMapper mapper;

	@Autowired
	private PageCreator pc;

	@Override
	public void regist(HealthVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<HealthVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}

	@Override
	public HealthVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update1(HealthVO vo) {
		mapper.update1(vo);
	}

	@Override
	public void update2(HealthVO vo) {
		mapper.update2(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

	@Override
	public HealthVO getPrevContent(int bno) {
		return mapper.getPrevContent(bno);
	}

	@Override
	public HealthVO getNextContent(int bno) {
		return mapper.getNextContent(bno);
	}

}
