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
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.service.FranchiseService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/search/*")
@Log4j
public class SearchController {

	@Autowired
	private FranchiseService service;

	@RequestMapping(value = "/searchData",method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ResponseEntity<List<StarInfoDTO>> searchData(@RequestParam("comName") String comName) throws Exception{
		
		log.info("************comName  : " + comName); // ajax로 보낸 comName 잘가져옴
		
		List<StarInfoDTO> result = service.searchResultAjax(comName);
		
		
		log.info("리스트 **********"+result);
		
		return new ResponseEntity<List<StarInfoDTO>>(result,HttpStatus.OK);
		
	}
	
}
