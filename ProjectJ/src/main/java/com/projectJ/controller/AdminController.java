package com.projectJ.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private AdminService service;
	
	
	@GetMapping("dbPlus")
	public void dbPlusGet() {
		log.info("************dbPlusGet 진입함***********");
	}
	@GetMapping("dbPlusPro")
	public void dbPlusPost(@RequestParam("type")String type,Model model) {
		log.info("************dbPlusPost 진입함***********");
		model.addAttribute("type", type);
		log.info("admin이 고른 type : " + type);
		service.addDb(type);
		
	}
	
	@GetMapping("check")
	public void check(Model model,@RequestParam("comName") String comName) {
		
		int result = service.check(comName);
		model.addAttribute("result", result);
		
	}
	
	
}
