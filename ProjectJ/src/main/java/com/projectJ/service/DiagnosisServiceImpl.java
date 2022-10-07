package com.projectJ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.persistence.DiagnosisMapper;

@Service
public class DiagnosisServiceImpl implements DiagnosisService{
	
	@Autowired
	private DiagnosisMapper mapper;

	@Override
	public List<LocalSalesDTO> searchResultAjaxSales(String type, String areaName) {
		return mapper.searchResultAjaxSales(type,areaName);
	}

}
