package com.projectJ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.service.FranchiseService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/franchise/*")
@Log4j
public class FranchiseController {
	
	@Autowired
	private FranchiseService service;
	
	@GetMapping("reviewMain")
	public void reviewMain() {
		log.info("reviewMain get방식 진입");
	}
	@GetMapping("reviewSearch")
	public void reviewSerachGet(@RequestParam("comName") String comName,Model model) {
		log.info("reviewSerach get방식 진입");
		
		//검색한 결과를 담은 dto 리스트 
		List<StarInfoDTO> result =service.searchResult(comName);
		//List<ReviewSearchDTO> result2 = service.searchResult2(comName);
		model.addAttribute("comName", comName);
		model.addAttribute("resultList", result);
		//model.addAttribute("resultList2", result2);
		
		
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
