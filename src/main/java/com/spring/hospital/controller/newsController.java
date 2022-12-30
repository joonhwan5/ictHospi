package com.spring.hospital.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.news.service.INewsService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/news")
public class newsController {

	@Autowired
	private INewsService service;
	
	// 병원 페이지 화면요청
	@GetMapping("newsMain")
	public void newsMain(PageVO vo, Model model) {
		model.addAttribute("newsList", service.getList(vo));

	}
	
	// 글쓰기 요청
	@PostMapping("/regist") 
	public String regist(MultipartFile file, NewsVO vo, HttpSession session, RedirectAttributes ra) {
		
		String adminId = "admin";
		/* String adminId = ((AdminVO)session.getAttribute("login")).getAdminId(); */
		vo.setAdminId(adminId);
		
		String uploadFolder = "C:/hospital/upload/news";
		vo.setUploadPath(uploadFolder);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String folderName = simpleDateFormat.format(date);
		uploadFolder = uploadFolder + "/" + folderName;
		vo.setFileLoca(uploadFolder);


		UUID uuid = UUID.randomUUID();
		String fileRealName = file.getOriginalFilename();

		String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."));
		String fileName = uuid.toString().replaceAll("-", "") + fileExtention;
		vo.setFileName(fileName);
		
		File folder = new File(uploadFolder);
		
		if(!folder.exists()) folder.mkdirs();
		
		File saveFile = new File(uploadFolder + "/" + fileName);
		try {
			file.transferTo(saveFile);
			service.regist(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/news/newsMain";
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
