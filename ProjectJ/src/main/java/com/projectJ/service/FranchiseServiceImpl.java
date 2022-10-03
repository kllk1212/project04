package com.projectJ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;
import com.projectJ.persistence.FranchiseMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FranchiseServiceImpl implements FranchiseService{
	
	@Autowired
	private FranchiseMapper mapper;
	
	@Override
	public List<StarInfoDTO> searchResult(String comName) {
		
		
		return mapper.searchResult(comName);
	}

	@Override
	public List<ReviewSearchDTO> searchResult2(String comName) {
		
		return mapper.searchResult2(comName);
	}

	
	
}