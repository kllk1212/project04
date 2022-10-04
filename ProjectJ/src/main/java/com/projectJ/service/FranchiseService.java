package com.projectJ.service;

import java.util.List;

import com.projectJ.domain.PagingVO;
import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;

public interface FranchiseService {

	public List<StarInfoDTO> searchResult(String comName);
	public List<StarInfoDTO> searchResultTest(PagingVO vo);
	
	//public List<ReviewSearchDTO> searchResult2(String comName);
	
	public int countSearch(String comName);

	
}
