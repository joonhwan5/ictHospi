package com.spring.hospital.introduce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.command.DoctorVO;

@Service
public class IntroDoctorsServiceImpl implements IIntroDoctorsService {

	@Autowired
	private IIntroDoctorsMapper mapper;
	
	
	@Override
	public void insert(DoctorVO vo) {
		mapper.insert(vo);

	}

	@Override
	public DoctorVO getDoctorInfo(String doctorName, String medicalDepartment) {
		return mapper.getDoctorInfo(doctorName, medicalDepartment);
	}

}
