package com.projectJ.service;

import java.util.List;

import com.projectJ.domain.LocalSalesDTO;

public interface DiagnosisService {
	
	
	// 조건검색창
	public List<LocalSalesDTO> searchResultAjaxSales(String type,String areaName); // 매출높은순으로 타고들어올경우
	public List<LocalSalesDTO> searchResultAjaxEa(String type,String areaName); // 점포 많은순으로 타고들어올경우

	
	
	
}
