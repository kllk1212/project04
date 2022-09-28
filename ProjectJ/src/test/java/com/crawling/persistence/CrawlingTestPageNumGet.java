package com.crawling.persistence;

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

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CrawlingTestPageNumGet {
	private static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private static final String WEB_DRIVER_PATH = "C:\\chromedriver\\chromedriver.exe";
	
	@Autowired
	private CrawlingMapper mapper;
	@Test
	public void test() {
		

		try {
			//해당 테마의 최대 페이지갯수 찾기
			String pageNum = "https://franchise.ftc.go.kr/mnu/00013/program/userRqst/list.do?searchCondition=&searchKeyword=&column=brd&selUpjong=21&selIndus=L1&pageUnit=10&pageIndex=1";
			Connection pageNumConn = Jsoup.connect(pageNum);
			Document pageNumDocument = pageNumConn.get();
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			ChromeOptions pageNumOptions = new ChromeOptions();
			
			WebDriver pageNumDriver = new ChromeDriver(pageNumOptions);
			pageNumOptions.addArguments("--disable-popup-blocking");
			pageNumOptions.addArguments("--disable-default-apps");
			pageNumOptions.addArguments("--disable-notifications");	
			// 페이지 열기
			pageNumDriver.get(pageNum);
			
			String num = pageNumDriver.findElement(By.cssSelector("#frm > div.seedbbs_pagination > div > ul > li.paginationLast > a")).getAttribute("href").substring(153);
			log.info("****************************** num : "+num);
			
			// 페이지 닫기
			pageNumDriver.close();
			
			
		}catch (Exception e) {
			
		}
	}
	
}
