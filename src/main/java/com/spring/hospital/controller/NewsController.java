package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.NewsVO;
import com.spring.hospital.news.service.INewsService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/news")
public class NewsController {

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
	
	@GetMapping("display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
		System.out.println(fileLoca);
		System.out.println(fileName);
		File file = new File(fileLoca + "/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/newsDetail/{bno}")
	public String newsDetail(@PathVariable int bno,
							 @ModelAttribute("p") PageVO vo,
							 Model model) {
		model.addAttribute("article", service.getContent(bno));
		return "news/newsDetail";
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