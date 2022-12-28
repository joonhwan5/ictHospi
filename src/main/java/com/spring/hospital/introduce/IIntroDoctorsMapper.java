package com.spring.hospital.introduce;

import com.spring.hospital.command.DoctorVO;

public interface IIntroDoctorsMapper {
	
	//의사 정보 인서트 하기 
	public void insert(DoctorVO vo);
		
	//의사 페이지 정보  불러오기
	public DoctorVO getDoctorInfo(String doctorName, String medicalDepartment);
	
}
