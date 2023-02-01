package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.command.HealthVO;
import com.spring.hospital.health.service.IHealthService;
import com.spring.hospital.util.PageVO;

@Controller
@RequestMapping("/health")
public class HealthController {

	@Autowired
	private IHealthService service;

	// 건강 컬럼 페이지 화면 요청
	@GetMapping("/healthMain")
	public void healthMain(PageVO paging, Model model) {
		if (paging.getOrder() == null) {
			paging.setOrder("desc");
		}
		model.addAttribute("healthList", service.getList(paging));
		model.addAttribute("pc", service.getPc(paging));
	}

	// 건강 컬럼 글쓰기 페이지 요청
	@GetMapping("/healthRegist")
	public void healthRegist() {

	}

	// 건강 컬럼 글쓰기 요청
	@PostMapping("/healthRegist")
	public String regist(MultipartFile file, HealthVO vo, HttpSession session, RedirectAttributes ra) {
		String osName = System.getProperty("os.name").toLowerCase();
		String uploadFolder = null;
		if(osName.contains("window")) {
			uploadFolder = "C:/hospital/upload/health";
		} else if(osName.contains("linux")) {
			uploadFolder = "/var/upload/health";
		} else {
			uploadFolder = "/Users/kimjuyoung/hospital/upload/health";
		}
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

		if (!folder.exists())
			folder.mkdirs();

		File saveFile = new File(uploadFolder + "/" + fileName);
		try {
			file.transferTo(saveFile);
			service.regist(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/health/healthMain";
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
		System.out.println(fileLoca);
		System.out.println(fileName);
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

	// 건강 컬럼 글 상세보기
	@GetMapping("/healthDetail/{bno}")
	public String healthDetail(@PathVariable String bno, @ModelAttribute("order") String order, @ModelAttribute("p") PageVO vo, 
				Model model, RedirectAttributes ra) {
		int parsingBno;
		
		try {
			parsingBno = Integer.parseInt(bno);
			
			model.addAttribute("article", service.getContent(parsingBno));
			model.addAttribute("articlePrev", service.getPrevContent(parsingBno));
			model.addAttribute("articleNext", service.getNextContent(parsingBno));
			return "health/healthDetail";
		} catch (Exception e) {
			ra.addFlashAttribute("msg", "잘못된 접근입니다.");
			return "redirect:/health/healthMain";
		}
		
	}

	// 모달 상세보기
	@GetMapping("/getDetail/{bno}")
	@ResponseBody
	public HealthVO getDetail(@PathVariable int bno) {
		return service.getContent(bno);
	}

	// 건강 컬럼 글 수정 페이지 이동 요청
	@PostMapping("/healthModify")
	public void healthModify(@ModelAttribute("article") HealthVO vo) {

	}

	// 건강 컬럼 글 수정 요청
	@PostMapping("/healthUpdate")
	public String update(MultipartFile file, HealthVO vo, RedirectAttributes ra) {

		if (file.getOriginalFilename() == "") {
			service.update1(vo);
		} else {
			String osName = System.getProperty("os.name").toLowerCase();
			String uploadFolder = null;
			if(osName.contains("window")) {
				uploadFolder = "C:/hospital/upload/health";
			} else if(osName.contains("linux")) {
				uploadFolder = "/var/upload/health";
			} else {
				uploadFolder = "/Users/kimjuyoung/hospital/upload/health";
			}
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

			if (!folder.exists())
				folder.mkdirs();

			File saveFile = new File(uploadFolder + "/" + fileName);
			try {
				file.transferTo(saveFile);
				service.update2(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ra.addFlashAttribute("msg", "수정 완료 되었습니다");
		ra.addAttribute("order", "desc");
		return "redirect:/health/healthDetail/" + vo.getBno();
	}

	// 건강 컬럼 글 삭제 요청
	@PostMapping("/healthDelete/{bno}")
	public String delete(@PathVariable int bno, RedirectAttributes ra) {
		HealthVO hvo = service.getContent(bno);
		
		service.delete(bno);
		
		File file = new File(hvo.getFileLoca() + "/" + hvo.getFileName());
		file.delete();
		
		ra.addFlashAttribute("msg", "게시글이 정상적으로 삭제되었습니다.");
		return "redirect:/health/healthMain";
	}

}
