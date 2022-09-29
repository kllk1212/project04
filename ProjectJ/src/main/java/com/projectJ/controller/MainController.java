package com.projectJ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {

	
	@GetMapping("main")				// 메인
	public void mainGet() {
		log.info("**********mainGet 진입");
		
	}
	
	@GetMapping("siteInfo") 		// 사이트 소개
	public void siteInfoGet() {
		log.info("**********siteInfoGet 진입");
		
	}
	
	@GetMapping("login") 			// 로그인
	public void loginGet() {
		log.info("*********loginGet 진입");
	}
	@GetMapping("signup") 			// 회원가입
	public void signupGet() {
		log.info("*********signupGet 진입");
	}
	
}
