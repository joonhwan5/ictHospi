package com.spring.hospital.intro.service;

import com.spring.hospital.command.DoctorVO;

public interface IIntroService {
				
	//각 의사 페이지에 정보 받아오기
	public DoctorVO getDoctorInfo(int doctorNo);

}
