package com.crawling.persistence;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.crawling.domain.CompanyDTO;
import com.crawling.domain.FranchiseeStatusDTO;
import com.crawling.domain.LocalSalesDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CrawlingTestFix2 {
	@Autowired
	private CrawlingMapper mapper;
	
	private static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private static final String WEB_DRIVER_PATH = "C:\\chromedriver\\chromedriver.exe";		

	@Test
	public void test() {


		try {

			String url = "https://franchise.ftc.go.kr/mnu/00013/program/userRqst/list.do?searchCondition=&searchKeyword=&column=brd&selUpjong=21&selIndus=H1&pageUnit=10&pageIndex=2";
			Connection conn = Jsoup.connect(url);
			Document document = conn.get();
			org.jsoup.select.Elements atag = document.getElementsByClass("authCtrl"); // 태그 중 클래스가 authCtrl 인놈만 담기
			// log.info(atag);
			// String atagAttr = atag.get(0).attr("onclick"); // atag의 0번 값의 onclick 속성 가진거

			List<String> urlBack = new ArrayList<String>(); // url주소 뒷부분 저장할꺼임
			log.info("1번 **************************************");
			for (int i = 0; i < atag.size(); i++) {
				int j = 0;
				String atagAttr = atag.get(i).attr("onclick").substring(9, 60).trim();
				urlBack.add(atagAttr);
				log.info(atagAttr);
				i++;
			}
			log.info(urlBack);
			
			// 주소 합친거!!!!!!
			for(int j = 0; j < urlBack.size(); j++) {
				String urlAll = "https://franchise.ftc.go.kr"+urlBack.get(j);
				log.info(urlAll);
				System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
				ChromeOptions options = new ChromeOptions();
				
				WebDriver driver = new ChromeDriver(options);
				options.addArguments("--disable-popup-blocking");
				options.addArguments("--disable-default-apps");
				options.addArguments("--disable-notifications");	
				
				driver.get(urlAll);
				Thread.sleep(2000);
	            // 회사번호 O
	            String c_comNo = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(5) > td.noborder")).getAttribute("textContent").trim();
	            // 상호명 O
	            String c_comTitle = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td.noborder")).getAttribute("textContent").replace("상호","").trim();
	            // 영업표지 O
	            log.info("**************************** 영업표지");
	            String c_comName = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(2)")).getAttribute("textContent").trim().substring(4);
	            // 회사분류 O
	            log.info("**************************** 회사분류");
	            String c_type = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim();
	            
	            // 전체 점포수 X
	            int c_storeCount;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child(1) > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	            	c_storeCount = 0;
	            }else {
	            	c_storeCount = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child(1) > td:nth-child(2)")).getAttribute("textContent").trim().replace(",", ""));            	
	            }
	            // 가입비 X
	            int c_memberFee;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td.noborder")).getAttribute("textContent").trim().equals("")) {
	            	c_memberFee = 0;
	            }else {
	            	c_memberFee = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td.noborder")).getAttribute("textContent").trim().replace(",",""));
	            }
	            // 교육비 X
	            int c_eduFee;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	            	c_eduFee = 0;
	            }else {
	            	c_eduFee = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(2)")).getAttribute("textContent").trim().replace(",",""));            	
	            }
	            // 보증금 X
	            int c_deposit;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	            	c_deposit = 0;
	            }else {
	            	c_deposit = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	            }
	            // 기타비 X
	            int c_etcFee; 
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	            	c_etcFee = 0;
	            }else {
	            	c_etcFee = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	            }
	            // 부담금 총액 X
	            int c_totalFee;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(5)")).getAttribute("textContent").trim().equals("")) {
	            	c_totalFee = 0;
	            }else {
	            	c_totalFee = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(15) > div > table:nth-child(2) > tbody > tr > td:nth-child(5)")).getAttribute("textContent").trim().replace(",",""));
	            }        
	            // 평균매출액 X
	            Long c_tAvgSales;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child(1) > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	            	c_tAvgSales= 0L;
	            }else {
	            	c_tAvgSales = Long.parseLong(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child(1) > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	            }            
	            // 면적당 평균 X
	            int c_tSquareSales;
	            if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	            	c_tSquareSales = 0;
	            }else {
	            	c_tSquareSales = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	            }            
	            // 회사대표
	            String c_comBoss = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(3)")).getAttribute("textContent").trim().replace("대표자","");
	            // 사업자유형
	            String c_comBm =  driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(3) > tbody > tr:nth-child(2) > td:nth-child(2)")).getAttribute("textContent").trim();
	            // 회사주소 트림안했음
	            String c_comAddr = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(3) > tbody > tr:nth-child(1) > td")).getAttribute("textContent");
	            // 대표번호 딱히 비교? 이런거 안할꺼같아서 스트링으로함 
	            String c_comNum = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(3) > td:nth-child(3)")).getAttribute("textContent").trim();
	            //회사이미지 - 디폴트이미지로 일단 ㅇㅇ      

	            CompanyDTO dto = new CompanyDTO();
	            dto.setC_comNo(c_comNo);
	            dto.setC_comTitle(c_comTitle);
	            dto.setC_comName(c_comName);
	            dto.setC_type(c_type);
	            dto.setC_storeCount(c_storeCount);
	            dto.setC_memberFee(c_memberFee);
	            dto.setC_eduFee(c_eduFee);
	            dto.setC_deposit(c_deposit);
	            dto.setC_etcFee(c_etcFee);
	            dto.setC_totalFee(c_totalFee);
	            dto.setC_tAvgSales(c_tAvgSales);
	            dto.setC_tSquareSales(c_tSquareSales);
	            dto.setC_comBoss(c_comBoss);
	            dto.setC_comBm(c_comBm);
	            dto.setC_comAddr(c_comAddr);
	            dto.setC_comNum(c_comNum);
	            
	            
	            mapper.insert(dto); // testCompany 테이블에 인서트 (회사정보)
	            
	            
	            // 공통 항목 year , zone / 배열로 넣어야하는 항목 zone / for문으로 넣어야하는 항목 franchiseeEa,aveSales,areaAveSales
	                    
	            // 지역 총 17개 
	            String[] zone = {"서울","부산","대구","인천","광주","대전","울산","세종","경기","강원","충북","충남","전북","전남","경북","경남","제주"};            
	            // String c_company 이놈도 공통
	            
	            //가맹점사업자의 평균 매출액 및 면적(3.3㎡)당 매출액 자료 넣기
	            for(int i = 2; i < zone.length+2;i++) {
	            	// 년도
	            	String l_year = driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > thead > tr:nth-child(1) > th.listOfCntShow")).getAttribute("textContent").trim();
	            	// 상호명
	            	String l_comName = c_comName;
	            	// 지역명
	            	String l_AreaName = zone[i-2];
	            	// 가맹점수
	            	int l_franchiseeEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	                	l_franchiseeEa = 0;
	                }else {
	                	l_franchiseeEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(2)")).getAttribute("textContent").trim().replace(",",""));
	                }            	
	            	// 평균매출
	                int l_avgSales;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	                	l_avgSales = 0;
	                }else {
	                	l_avgSales  = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	                }
	                // 면적당 평균매출
	                int l_areaAvgSales;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	                	l_areaAvgSales = 0;
	                }else {
	                	l_areaAvgSales = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(8) > tbody > tr:nth-child("+(i)+") > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	                }               
	                // 요식업 종류
	                String l_type = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim();               
	                
	                log.info("*************************현재 i : " + i);
	                LocalSalesDTO salesDTO = new LocalSalesDTO();
	                
	                salesDTO.setL_year(l_year);
	                salesDTO.setL_comName(l_comName);
	                salesDTO.setL_areaName(l_AreaName);
	                salesDTO.setL_franchiseeEa(l_franchiseeEa);
	                salesDTO.setL_avgSales(l_avgSales);
	                salesDTO.setL_areaAvgSales(l_areaAvgSales);
	                salesDTO.setL_type(l_type);

	                
	                mapper.insertLocalSales(salesDTO);
	            }
	            
	            // 가맹점 및 직영점 현황 - 1번째란 
	            for(int i = 2; i < zone.length+2; i++) {
	            	// 지역이름
	            	String f_areaName = c_comName;
	            	// 년도
	            	String f_year = driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > thead > tr:nth-child(1) > th:nth-child(2)")).getAttribute("textContent").trim();
	            	// 상호명
	            	String f_comName = zone[i-2];
	            	// 대리점수 + 직영점수
	            	int f_totalEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	                	f_totalEa = 0;
	                }else {
	                	f_totalEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().replace(",","")); 			
	                }
	            	// 대리점수
	                int f_franchiseeEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	                	f_franchiseeEa = 0;
	                }else {
	                	f_franchiseeEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	                }               
	            	// 직영점수
	                int f_directEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	                	f_directEa = 0;
	                }else {
	                	f_directEa  = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	                }           
	                // 회사분류
	                String f_type = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim();               
	                
	                log.info("*************************현재 i : " + i);
	            	
	            	FranchiseeStatusDTO statusDTO = new FranchiseeStatusDTO();
	            	statusDTO.setF_areaName(f_areaName);
	            	statusDTO.setF_year(f_year);
	            	statusDTO.setF_comName(f_comName);
	            	statusDTO.setF_totalEa(f_totalEa);
	            	statusDTO.setF_franchiseeEa(f_franchiseeEa);
	            	statusDTO.setF_directEa(f_directEa);
	            	statusDTO.setF_type(f_type);
	            	
	            	
	            	mapper.insertFranchiseeStatus(statusDTO);
	            }
	            // 가맹점 및 직영점 현황 - 2번째란 
	            for(int i = 2; i < zone.length+2; i++) {
	            	// 지역이름
	            	String f_areaName = c_comName;
	            	// 년도
	            	String f_year = driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > thead > tr:nth-child(1) > th:nth-child(3)")).getAttribute("textContent").trim();
	            	// 상호명
	            	String f_comName = zone[i-2];
	            	// 대리점수 + 직영점수
	            	int f_totalEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	                	f_totalEa = 0;
	                }else {
	                	f_totalEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().replace(",","")); 			
	                }
	            	// 대리점수
	                int f_franchiseeEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	                	f_franchiseeEa = 0;
	                }else {
	                	f_franchiseeEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	                }               
	            	// 직영점수
	                int f_directEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	                	f_directEa = 0;
	                }else {
	                	f_directEa  = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	                }           
	                // 회사분류
	                String f_type = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim();               
	                
	                log.info("*************************현재 i : " + i);
	            	
	            	FranchiseeStatusDTO statusDTO = new FranchiseeStatusDTO();
	            	statusDTO.setF_areaName(f_areaName);
	            	statusDTO.setF_year(f_year);
	            	statusDTO.setF_comName(f_comName);
	            	statusDTO.setF_totalEa(f_totalEa);
	            	statusDTO.setF_franchiseeEa(f_franchiseeEa);
	            	statusDTO.setF_directEa(f_directEa);
	            	statusDTO.setF_type(f_type);
	            	
	            	
	            	mapper.insertFranchiseeStatus(statusDTO);
	            }
	            // 가맹점 및 직영점 현황 - 3번째란 
	            for(int i = 2; i < zone.length+2; i++) {
	            	// 지역이름
	            	String f_areaName = c_comName;
	            	// 년도
	            	String f_year = driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > thead > tr:nth-child(1) > th:nth-child(4)")).getAttribute("textContent").trim();
	            	// 상호명
	            	String f_comName = zone[i-2];
	            	// 대리점수 + 직영점수
	            	int f_totalEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().equals("")) {
	                	f_totalEa = 0;
	                }else {
	                	f_totalEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(2)")).getAttribute("textContent").trim().replace(",","")); 			
	                }
	            	// 대리점수
	                int f_franchiseeEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().equals("")) {
	                	f_franchiseeEa = 0;
	                }else {
	                	f_franchiseeEa = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(3)")).getAttribute("textContent").trim().replace(",",""));
	                }               
	            	// 직영점수
	                int f_directEa;
	                if(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().equals("")) {
	                	f_directEa = 0;
	                }else {
	                	f_directEa  = Integer.parseInt(driver.findElement(By.cssSelector("#frm > div:nth-child(13) > div > table:nth-child(4) > tbody > tr:nth-child("+i+") > td:nth-child(4)")).getAttribute("textContent").trim().replace(",",""));
	                }           
	                // 회사분류
	                String f_type = driver.findElement(By.cssSelector("#frm > div:nth-child(12) > div > table:nth-child(2) > tbody > tr:nth-child(1) > td:nth-child(4)")).getAttribute("textContent").trim();               
	          
	                log.info("*************************현재 i : " + i);
	            	
	            	FranchiseeStatusDTO statusDTO = new FranchiseeStatusDTO();
	            	statusDTO.setF_areaName(f_areaName);
	            	statusDTO.setF_year(f_year);
	            	statusDTO.setF_comName(f_comName);
	            	statusDTO.setF_totalEa(f_totalEa);
	            	statusDTO.setF_franchiseeEa(f_franchiseeEa);
	            	statusDTO.setF_directEa(f_directEa);
	            	statusDTO.setF_type(f_type);
	            	
	            	
	            	mapper.insertFranchiseeStatus(statusDTO);
	            	
	            }			
				driver.close();
				log.info("******************** j번 저장완료 : " + j + "***********************");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();

		}//catch

	}//test()

}
