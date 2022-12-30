package com.spring.hospital.claim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.claim.mapper.IClaimMapper;
import com.spring.hospital.command.ClaimVO;
import com.spring.hospital.util.PageCreator;
import com.spring.hospital.util.PageVO;

@Service
public class ClaimServiceImpl implements IClaimService {
	
	@Autowired
	private IClaimMapper mapper;
	@Autowired
	private PageCreator pc;

	@Override
	public void regist(ClaimVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<ClaimVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}

	@Override
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}

	@Override
	public ClaimVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(ClaimVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

}
