package com.projectJ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.service.DiagnosisService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/diagnosis/*")
@Log4j
public class DiagnosisController {
	
	@Autowired
	private DiagnosisService service;
	
	@GetMapping("diagnosisMain")
	public void diagnosisMainGet() {
		log.info("diagnosisMainGet 진입 ***********");
	}
	@GetMapping("diagnosisResult")
	public void diagnosisResultGet(@RequestParam("comName") String comName) {
		log.info("diagnosisResultGet 진입 ***********");
		log.info("**********************************comName : "+comName);
	}

}
