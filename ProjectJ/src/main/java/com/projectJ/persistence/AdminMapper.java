package com.projectJ.persistence;

import com.projectJ.domain.CompanyDTO;
import com.projectJ.domain.FranchiseeStatusDTO;
import com.projectJ.domain.LocalSalesDTO;
import com.projectJ.domain.StarInfoDTO;

public interface AdminMapper {

	
	public void insertCompanyInfo(CompanyDTO dto);
	
	public void insertLocalSales(LocalSalesDTO salesDTO);
	
	public void insertFranchiseeStatus(FranchiseeStatusDTO statusDTO);
	
	public int check(String comName);
	
	public void inserStarInfo(StarInfoDTO starDTO); // 별점테이블 상호명 넣기 (디폴트 000000)
	
	
}
