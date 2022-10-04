package com.projectJ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.projectJ.domain.PagingVO;
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
	@GetMapping("reviewSearch")//@RequestParam("comName") String
	public void reviewSearchGet(PagingVO vo,@RequestParam("comName") String comName,Model model
			, @RequestParam(value = "nowPage" ,required = false)String nowPage
			,@RequestParam(value = "cntPerPage" ,required = false)String cntPerPage) throws Exception{
		log.info("reviewSerach get방식 진입");

		//검색한 결과를 담은 dto 리스트 
		int total = service.countSearch(comName);
		log.info("****************total : " + total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),comName);
		log.info("*****************vo : " + vo);
		model.addAttribute("paging", vo);
		//List<StarInfoDTO> result = service.searchResult(comName);
		List<StarInfoDTO> resultTest = service.searchResultTest(vo);
		//List<ReviewSearchDTO> result2 = service.searchResult2(comName);

		model.addAttribute("comName", comName);

		model.addAttribute("resultList", resultTest);
	

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
