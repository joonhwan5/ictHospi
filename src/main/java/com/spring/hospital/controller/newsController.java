package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.news.service.INewsService;

@Controller
@RequestMapping("/news")
public class newsController {

	@Autowired
	private INewsService service;
	
	// 병원 페이지 화면요청
	@GetMapping("newsMain")
	public void newsMain() {
		System.out.println("소식 메인 페이지 이동 요청(GET)");
	}
	
	// 글쓰기 요청
	@PostMapping("/regist") 
	public String regist(MultipartFile file, String content, HttpSession session) {
		NewsVO vo = new NewsVO();
		
		String adminId = ((NewsVO)session.getAttribute("login")).getAdminId();
		vo.setAdminId(adminId);
		
		String uploadFolder = "C:/hospital/upload/news";
		vo.setUploadPath(uploadFolder);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
		String folderName = simpleDateFormat.format(date);
		uploadFolder = uploadFolder + "/" + folderName;
		vo.setFileLoca(uploadFolder);
		
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString().replaceAll("-", "");
		vo.setFileName(fileName);
		
		vo.setContent(content);
		
		File folder = new File(uploadFolder);
		
		if(!folder.exists()) folder.mkdirs();
		
		File saveFile = new File(uploadFolder + "/" + fileName);
		
		try {
			file.transferTo(saveFile);
			service.regist(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return "업로드 실패";
		}
		return "업로드 성공";
	}
	
	

	@GetMapping("newsDetail")
	public void newsDetail() {

	}

	@GetMapping("healthMain")
	public void healthMain() {

	}

	@GetMapping("healthDetail")
	public void healthDetail() {

	}

	@GetMapping("newsRegist")
	public void newsRegist() {

	}
	
	@GetMapping("healthRegist")
	public void healthRegist() {
		
	}
	
	@GetMapping("newsModify")
	public void newsModify() {
		
	}
	
	@GetMapping("healthModify")
	public void healthModify() {
		
	}
	
}
