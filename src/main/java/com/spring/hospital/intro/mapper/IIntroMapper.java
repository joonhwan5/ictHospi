package com.spring.hospital.intro.mapper;

import com.spring.hospital.command.DoctorVO;

public interface IIntroMapper {
	
	//의사 정보 인서트 하기 
	public void insert(DoctorVO vo);
		
	//의사 페이지 정보  불러오기
	public DoctorVO doctorPage(String doctorName, String medicalDepartment);
	
	//각 의사 정보 받아오기
	public DoctorVO getDoctorInfo(int doctorNo);
}
