package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.FoodVO;
import com.spring.hospital.food.service.IFoodService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/food")
public class FoodController {
	
	@Autowired
	private IFoodService service;
	
	//목록 화면
	@GetMapping("/foodMain")
	public void foodMain(PageVO paging, Model model) {
		model.addAttribute("foodList", service.getList(paging));
		model.addAttribute("pc", service.getPc(paging));
	}
	
	//글 등록 페이지 이동
	@GetMapping("/foodRegist")
	public void foodRegist() {
		
	}
	
	//글 등록 처리
	@PostMapping("/foodRegist")
	public String foodRegist(MultipartFile file, FoodVO vo, HttpSession session, RedirectAttributes ra) {
		String osName = System.getProperty("os.name").toLowerCase();
		String uploadFolder = null;
		
		if(osName.contains("window")) {
			uploadFolder = "C:/hospital/upload/food";
		} else {
			uploadFolder = "/Users/kimjuyoung/hospital/upload/food";
		}
		
		vo.setUploadPath(uploadFolder);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String folderName = simpleDateFormat.format(date);
		uploadFolder = uploadFolder + "/" + folderName;
		vo.setFileLoca(uploadFolder);
		
		UUID uuid = UUID.randomUUID();
		String fileRealName = file.getOriginalFilename();
		vo.setFileRealName(fileRealName);
		
		String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."));
		String fileName = uuid.toString().replace("-", "") + fileExtention;
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
		return "redirect:/food/foodMain";
	}
	
	//이미지 띄우기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
		
		File file = new File(fileLoca + "/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//글 상세보기 피이지 이동
	@GetMapping("/foodDetail/{bno}")
	public String foodDetail(@PathVariable int bno, Model model,
							 @ModelAttribute("p") PageVO paging,
							 HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("article", service.getContent(bno));
		model.addAttribute("articlePrev", service.getPrevContent(bno));
		model.addAttribute("articleNext", service.getNextContent(bno));
		
		String number = Integer.toString(bno);
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getName());
			if(cookie.getName().equals("visit")) {
				visitor = 1;
				System.out.println("visit통과");
				if(cookie.getValue().contains(number)) {
					System.out.println("visitif통과");
				} else {
					cookie.setValue(cookie.getValue() + "_" + number);
					response.addCookie(cookie);
					service.viewCount(bno);
				}
			}
		}
		if(visitor == 0) {
			Cookie newCookie = new Cookie("visit", number);
			response.addCookie(newCookie);
			service.viewCount(bno);
		}
		return "food/foodDetail";
	}
	
	//모달 상세보기
	@GetMapping("/getDetail/{bno}")
	@ResponseBody
	public FoodVO getDetail(@PathVariable int bno) {
		return service.getContent(bno);
	}
	
	//글 수정 화면 이동
	@PostMapping("/foodModify")
	public void foodModify(@ModelAttribute("article") FoodVO vo) {
		
	}
	
	//글 수정 처리
	@PostMapping("/foodUpdate")
	public String update(MultipartFile file, FoodVO vo, RedirectAttributes ra) {
		
		if(file.getOriginalFilename() == "") {
			service.update1(vo);
			System.out.println("getOriginalFilename: " + file.getOriginalFilename());
		} else {
			String osName = System.getProperty("os.name").toLowerCase();
			String uploadFolder = null;
			if(osName.contains("window")) {
				uploadFolder = "C:/hospital/upload/food";
			} else {
				uploadFolder = "/Users/kimjuyoung/hospital/upload/food"; // Mac
			}
			vo.setUploadPath(uploadFolder);
			
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String folderName = simpleDateFormat.format(date);
			uploadFolder = uploadFolder + "/" + folderName;
			vo.setFileLoca(uploadFolder);
			
			UUID uuid = UUID.randomUUID();
			String fileRealName = file.getOriginalFilename();
			vo.setFileRealName(fileRealName);
			
			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."));
			String fileName = uuid.toString().replaceAll("-", "") + fileExtention;
			vo.setFileName(fileName);
			
			File folder = new File(uploadFolder);
			
			if(!folder.exists()) folder.mkdirs();
			
			File saveFile = new File(uploadFolder + "/" + fileName);
			try {
				file.transferTo(saveFile);
				service.update2(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ra.addFlashAttribute("msg", "수정 완료 되었습니다.");
		return "redirect:/food/foodDetail/" + vo.getBno();
	}
	
	//글 삭제 처리
	@PostMapping("/foodDelete")
	public String foodDelete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/food/foodMain";
	}
	
	//식단 다운로드
	@GetMapping("/download")
	@ResponseBody
	public ResponseEntity<byte[]> download(String fileLoca, String fileName, String fileRealName) throws Exception {
		
		File file = new File(fileLoca + "/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Disposition", "attachment; filename=" + new String(fileRealName.getBytes("UTF-8"), "ISO-8859-1"));
		
		try {
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
