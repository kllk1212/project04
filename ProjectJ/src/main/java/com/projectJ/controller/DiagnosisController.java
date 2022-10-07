package com.projectJ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
