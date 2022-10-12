package com.projectJ.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.projectJ.domain.LocalSalesDTO;

public interface DiagnosisMapper {
	
	// ajax 검색용 조건검색 창에서	쓰는 검색기능 
	public List<LocalSalesDTO> searchResultAjaxSales(@Param("type") String type,@Param("areaName") String areaName); //매출높은순
	public List<LocalSalesDTO> searchResultAjaxEa(@Param("type") String type,@Param("areaName") String areaName); //점포 많은 순
	
	
	
}
