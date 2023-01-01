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
		
		String uploadPath = "C:/hospital/upload/doctor/" + fileLoca;
		
		File folder = new File(uploadPath);
		if(!folder.exists()) folder.mkdirs();
		
		String fileRealName = file.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		
		
		System.out.println("저장할 폴더 경로: " + uploadPath);
		System.out.println("폴더명: " + fileLoca);
		System.out.println("확장자: " + fileExtension);
		System.out.println("고유 랜덤 문자: " + uuids);
		
		String fileName = uuids + fileExtension;
		System.out.println("변경해서 저장할 파일명: " + fileName);
		
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
	
	
	
	
	
	

}
