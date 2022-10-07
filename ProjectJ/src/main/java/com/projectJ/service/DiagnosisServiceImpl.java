package com.projectJ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.persistence.DiagnosisMapper;

@Service
public class DiagnosisServiceImpl implements DiagnosisService{
	
	@Autowired
	private DiagnosisMapper mapper;

}
