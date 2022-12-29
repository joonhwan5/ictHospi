package com.spring.hospital.intro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.DoctorVO;
import com.spring.hospital.intro.mapper.IIntroMapper;

@Service
public class IntroServiceImpl implements IIntroService {
	
	@Autowired
	private IIntroMapper mapper;

	@Override
	public void insert(DoctorVO vo) {
		mapper.insert(vo);

	}

	@Override
	public DoctorVO doctorPage(String doctorName, String medicalDepartment) {
		return mapper.doctorPage(doctorName, medicalDepartment);
	}
	
	@Override
	public DoctorVO getDoctorInfo(int doctorNo) {
		return mapper.getDoctorInfo(doctorNo);
	}

}
