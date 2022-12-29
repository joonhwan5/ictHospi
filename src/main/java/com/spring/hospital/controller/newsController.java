package com.spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class newsController {
	@GetMapping("newsMain")
	   public void newsMain() {
	      
	   }
	   
	   @GetMapping("newsContent")
	   public void newsContent() {
	      
	   }
	   
	   @GetMapping("healthColumn")
	   public void healthColumn() {
	      
	   }
	   
	   @GetMapping("healthContent")
	   public void healthContent() {
	      
	   }
	   
	   @GetMapping("newsRegist")
	   public void newsRegist() {
		   
	   }
}
