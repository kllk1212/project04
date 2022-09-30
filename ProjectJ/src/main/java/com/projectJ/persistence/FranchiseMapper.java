package com.projectJ.persistence;

import java.util.List;

import com.projectJ.domain.ReviewSearchDTO;
import com.projectJ.domain.StarInfoDTO;

public interface FranchiseMapper {

	
	
	public List<StarInfoDTO> searchResult(String comName);
	public List<ReviewSearchDTO> searchResult2(String comName);
	
	
	
}
