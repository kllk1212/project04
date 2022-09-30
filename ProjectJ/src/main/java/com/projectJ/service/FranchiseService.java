package com.projectJ.service;

import java.util.List;

import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;

public interface FranchiseService {

	public List<StarInfoDTO> searchResult(String comName);
	
	public List<ReviewSearchDTO> searchResult2(String comName);
	
}
