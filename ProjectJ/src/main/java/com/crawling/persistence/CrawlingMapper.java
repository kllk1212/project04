package com.crawling.persistence;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;

public interface CrawlingMapper {

	public void insert(CompanyDTO dto);
	
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	
}
