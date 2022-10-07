package com.projectJ.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.service.DiagnosisService;
import com.projectJ.service.FranchiseService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/search/*")
@Log4j
public class SearchController {

	@Autowired
	private FranchiseService service;

	@Autowired
	private DiagnosisService serviceDia;
	
	@RequestMapping(value = "/searchData",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody // 계산기 검색할때씀!!
	public ResponseEntity<List<StarInfoDTO>> searchData(@RequestParam("comName") String comName) throws Exception{
		
		log.info("************comName  : " + comName); // ajax로 보낸 comName 잘가져옴
		
		List<StarInfoDTO> result = service.searchResultAjax(comName);
		
		
		log.info("리스트 **********"+result);
		
		return new ResponseEntity<List<StarInfoDTO>>(result,HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/searchDataConstraint",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody // 조건검색 할때씀!!
	public ResponseEntity<List<LocalSalesDTO>> searchDataConstraint(@RequestParam("type") String type,@RequestParam("areaName") String areaName
			,@RequestParam("constraint") int constraint) throws Exception{
		
		log.info("************type  : " + type); 
		log.info("************areaName  : " + areaName); 
		log.info("************constraint 매출 1 , 점포수 2 , 가맹비낮은순 3  : " + constraint);
		
		if(constraint == 1) {
			List<LocalSalesDTO> result = serviceDia.searchResultAjaxSales(type,areaName); // 매출
			return new ResponseEntity<List<LocalSalesDTO>>(result,HttpStatus.OK);
		//log.info("리스트 **********"+result);
		}else if(constraint == 2) {
			List<LocalSalesDTO> result = serviceDia.searchResultAjaxSales(type,areaName); // 점포수
			return new ResponseEntity<List<LocalSalesDTO>>(result,HttpStatus.OK);
			
		}else{
			List<LocalSalesDTO> result = serviceDia.searchResultAjaxSales(type,areaName); // 가맹비낮은순
			return new ResponseEntity<List<LocalSalesDTO>>(result,HttpStatus.OK);
		}
	}
	
}
