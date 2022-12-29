package com.spring.hospital.admin.service;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> origin/doyoung
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hospital.admin.mapper.IAdminMapper;
import com.spring.hospital.command.DoctorVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminMapper mapper;
	
	@Override
	public void registDoctor(DoctorVO vo) {

	}
<<<<<<< HEAD
	
	@Override
	public List<DoctorVO> getDoctorList(String subject) {
		return mapper.getDoctorList(subject);
	}
=======
>>>>>>> origin/doyoung

}
