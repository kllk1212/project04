package com.projectJ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectJ.domain.UserInfoDTO;
import com.projectJ.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	
	@Autowired
	private MainService service;

	
	@GetMapping("main")				// 메인
	public void mainGet() {
		log.info("**********mainGet 진입");
		//123
		
	}
	
	@GetMapping("siteInfo") 		// 사이트 소개
	public void siteInfoGet() {
		log.info("**********siteInfoGet 진입");
		
	}
	
	@GetMapping("login") 			// 로그인
	public void loginGet() {
		log.info("*********loginGet 진입");
	}
	@GetMapping("signup") 			// 회원가입 창
	public void signupGet() {
		log.info("*********signupGet 진입");
	}
	
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheck(UserInfoDTO dto) {
		int result = service.idCheck(dto);
		log.info("************** 중복이면 1 아니면 0 : "+result);
		String message = null;
		if(result == 1) {
			message="fail";
		}else {
			message="success";
		}
		
		return message;
	}
	
	
	
	
	@PostMapping("signup") 			// 회원가입 정보 입력 후 
	public String signupPost(UserInfoDTO userDTO) {
		log.info("*********signupPost 진입");
		service.insertUserData(userDTO);
		
		return "redirect:/main/signupComplete";
	}
	
	
	
	
	@GetMapping("signupComplete")
	public void signupCompleteGet() {
		log.info("signupComplete ***** 진입");
	}
	
	
	
}
