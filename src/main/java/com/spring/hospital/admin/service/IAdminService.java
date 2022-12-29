package com.spring.hospital.admin.service;

import java.util.List;

import com.spring.hospital.command.DoctorVO;

public interface IAdminService {

	//의사 신규 등록
	public void registDoctor(DoctorVO vo);
	
	//의사 목록 불러오기
	public List<DoctorVO> getDoctorList(String subject);
	
	//의사 정보 수정
	
	//의사 정보 삭제
	
}
