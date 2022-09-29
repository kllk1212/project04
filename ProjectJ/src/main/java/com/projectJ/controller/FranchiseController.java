package com.projectJ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/franchise/*")
@Log4j
public class FranchiseController {
	
	
	@GetMapping("reviewMain")
	public void reviewMain() {
		log.info("reviewMain get방식 진입");
	}
	

	
	@GetMapping("incomeCalcMain")
	public void incomCalcMainGet() {		
		log.info("incomeCalcMain get방식 진입");
	}

	@GetMapping("rankMain")
	public void rankMainnGet() {		
		log.info("rankMain get방식 진입");
	}
	
}
