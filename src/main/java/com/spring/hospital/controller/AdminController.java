package com.spring.hospital.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.hospital.admin.service.IAdminService;
import com.spring.hospital.command.DoctorVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	@GetMapping("/adminPageMain")
	public void adminPageMain(Model model) {
		model.addAttribute("doctorList", service.getDoctorlistAdmin());
	}
	
	@GetMapping("/adminPageRegist")
	public void adminPageRegist() {
		
	}
	@GetMapping("/adminPageModify")
	public void adminPageModify(Model model) {
		model.addAttribute("doctorList", service.getDoctorlistAdmin());
	}
	
	@ResponseBody
	@PostMapping("/getDoctorList")
	public List<DoctorVO> getDoctorList(@RequestBody String subject) {

		return service.getDoctorList(subject);
	}
		
	
	@PostMapping("/registDoctor")
	public String registDoctor(DoctorVO vo, MultipartFile file) {
		service.registDoctor(vo, file);
		
		return "redirect:/admin/adminPageMain";
	}
	
	
	@GetMapping("/doctorDisplay")
	public ResponseEntity<byte[]> doctorDisplay(String fileName) {
		String osName = System.getProperty("os.name").toLowerCase();
		File file = null;
		
		if(osName.contains("window")) {
			file = new File("C:/hospital/upload/doctor/" + fileName);
		} else if(osName.contains("linux")) {
			file = new File("/var/upload/doctor/" + fileName);
		} else {
			file = new File("/Users/kimjuyoung/hospital/upload/doctor/" + fileName);
		}
		
		ResponseEntity<byte[]>result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@PostMapping("/modifyDoctor")
	public String modifyDoctor(DoctorVO vo, MultipartFile file, RedirectAttributes ra) {
		
		if(file.getOriginalFilename() == "") {
			service.update1(vo);
		} else {
			new File(vo.getUploadPath() + "/" + vo.getFileName()).delete();
			
			String osName = System.getProperty("os.name").toLowerCase();
			String uploadFolder = null;
			
			Date date = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String folderName = simpleDateFormat.format(date);
			
			if(osName.contains("window")) {
				uploadFolder = "C:/hospital/upload/doctor/" + folderName;
			} else if(osName.contains("linux")){
				uploadFolder = "/var/upload/" + folderName;
			} else {
				uploadFolder = "/Users/kimjuyoung/hospital/upload/doctor/" + folderName;
			}
			
			vo.setUploadPath(uploadFolder);
			
			vo.setFileLoca(folderName);
			
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
		ra.addFlashAttribute("msg", "수정 완료 되었습니다.");
		return "redirect:/admin/adminPageMain";
	}
	
	
	
	@PostMapping("/deleteDoctor")
	public String deleteDoctor(String[] checkList, RedirectAttributes ra) {
		System.out.println("checkList: " + checkList);
		if(checkList == null) {
			ra.addFlashAttribute("msg", "삭제할 의사를 선택해주세요");
			return "redirect:/admin/adminPageMain";
		}
		
		for(String i : checkList) {
			DoctorVO vo = service.getDoctorOne(Integer.parseInt(i));
			File file = new File(vo.getUploadPath() + "/" + vo.getFileName());
			file.delete();
			
			service.deleteDoctor(Integer.parseInt(i));
		}
		
		ra.addFlashAttribute("msg", "삭제완료");
		return "redirect:/admin/adminPageMain";
		
	}
	
	
	/*
	@ResponseBody
	@postMapping("/deleteDoctor")
	public String deleteDoctor(@RequestBody Map<String, ArrayList<Integer>> doctorMap) {
		System.out.println("doctorMap : " + doctorMap);
		
		int cnt = doctorMap.get("listMap").size();
		System.out.println(cnt);
		
		List<Integer> list = doctorMap.get("listMap");
		
		for(int ex : list) {
			DoctorVO vo = service.getDoctorOne(ex);
			System.out.println(vo);
			service.deleteDoctor(ex);
			File file = new File(vo.getUploadPath() + "/" + vo.getFileName());
			file.delete();
		}
		
		return "success";
		
		
	}
	
	 */
	
}
