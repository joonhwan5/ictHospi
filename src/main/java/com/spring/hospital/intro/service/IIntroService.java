package com.spring.hospital.intro.service;

import com.spring.hospital.command.DoctorVO;

public interface IIntroService {
	
	//의사 정보 인서트 하기 
	public void insert(DoctorVO vo);
			
	//각 의사 페이지  불러오기
	public DoctorVO doctorPage(String doctorName, String medicalDepartment);
		
	//각 의사 정보 받아오기
	public DoctorVO getDoctorInfo(int doctorNo);

}
