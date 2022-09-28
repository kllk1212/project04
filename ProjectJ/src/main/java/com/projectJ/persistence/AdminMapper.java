package com.projectJ.persistence;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;

public interface AdminMapper {

	
	public void insertCompanyInfo(CompanyDTO dto);
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	public int check(String comName);
	
	
}
