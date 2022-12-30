package com.spring.hospital.admin.mapper;

import java.util.List;

import com.spring.hospital.command.DoctorVO;


public interface IAdminMapper {

	//의사 신규 등록
	public void registDoctor(DoctorVO vo);
	
	//의사 목록 불러오기
	public List<DoctorVO> getDoctorList(String subject);
		
	
}
