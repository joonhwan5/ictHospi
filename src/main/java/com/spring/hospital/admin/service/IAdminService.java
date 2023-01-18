package com.spring.hospital.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.hospital.command.DoctorVO;

public interface IAdminService {

	//의사 신규 등록
	public void registDoctor(DoctorVO vo, MultipartFile file);
	
	//의사 목록 불러오기
	public List<DoctorVO> getDoctorList(String subject);
	
	//의료진 관리에 의사 정보 불러오기
	public List<DoctorVO> getDoctorlistAdmin();
	
	//의사 정보 수정
	
	//의사 정보 삭제
	public void deleteDoctor(int doctorNo);
	
	//의사 1명 불러오기
	public DoctorVO getDoctorOne(int doctorNo);
}
