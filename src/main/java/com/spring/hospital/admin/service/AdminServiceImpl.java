package com.spring.hospital.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.hospital.admin.mapper.IAdminMapper;
import com.spring.hospital.command.DoctorVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminMapper mapper;
	
	@Override
	public void registDoctor(DoctorVO vo, MultipartFile file) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(new Date());
		String osName = System.getProperty("os.name").toLowerCase();
		String uploadPath = null;
		
		if(osName.contains("window")) {
			uploadPath = "C:/hospital/upload/doctor/" + fileLoca;
		} else {
			uploadPath = "/Users/kimjuyoung/hospital/upload/doctor/" + fileLoca;
		}
		
		File folder = new File(uploadPath);
		if(!folder.exists()) folder.mkdirs();
		
		String fileRealName = file.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		
		String fileName = uuids + fileExtension;
		
		File saveFile = new File(uploadPath + "/" + fileName);
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setUploadPath(uploadPath);
		vo.setFileLoca(fileLoca);
		vo.setFileName(fileName);
		
		mapper.registDoctor(vo);
	}
	
	@Override
	public List<DoctorVO> getDoctorList(String subject) {
		return mapper.getDoctorList(subject);
	}
	
	
	@Override
	public List<DoctorVO> getDoctorlistAdmin() {
		return mapper.getDoctorlistAdmin();
	}
	
	
	@Override
	public void deleteDoctor(int doctorNo) {
		mapper.deleteDoctor(doctorNo);
		
	}
	
	@Override
	public DoctorVO getDoctorOne(int doctorNo) {
		return mapper.getDoctorOne(doctorNo);
	}
	
	
	@Override
	public void update1(DoctorVO vo) {
		mapper.update1(vo);		
	}
	
	@Override
	public void update2(DoctorVO vo) {
		mapper.update2(vo);
	}
	

}
