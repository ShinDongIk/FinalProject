package com.payalot.enjoyforott.crawl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.logging.LogType;
import org.openqa.selenium.logging.LoggingPreferences;
import org.openqa.selenium.remote.CapabilityType;
import org.springframework.stereotype.Component;

import com.payalot.enjoyforott.poster.model.vo.PosterRank;

@Component
public class crRank {
	
	

	public ArrayList<PosterRank> OttRank(String name) throws InterruptedException {
		
		WebDriver driver = null;	
		
		System.setProperty("webdriver.chrome.driver", "C:\\chromedriver.exe");//Web Driver 압축 해제 경로 입력
		
		  ChromeOptions options = new ChromeOptions();
		  options.addArguments(
		   "--verbose",
		   "--headless", //창 안뜨게 하는구문
		   "--disable-web-security",
		   "--ignore-certificate-errors",
		   "--allow-running-insecure-content",
		   "--allow-insecure-localhost",
		   "--no-sandbox",
		   "--disable-gpu"
		  );
		  LoggingPreferences logs = new LoggingPreferences();
		  logs.enable(LogType.PERFORMANCE, Level.ALL);
		  options.setCapability(CapabilityType.LOGGING_PREFS, logs);
		  options.setAcceptInsecureCerts(true);
		
		  driver = new ChromeDriver(options);//WebDriver 객체 생성
		  driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);//로드 웹페이지에서 특정 요소를 찾을 때까지 기다리는 시간 설정
		  driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);//페이지로드가 완료 될 때까지 기다리는 시간 설정
		  driver.manage().window().maximize();//브라우저 창 최대화
		  if(name==null) {
			  driver.get("https://m.kinolights.com/ranking/kino");  
		  }else {
			  
			  driver.get("https://m.kinolights.com/ranking/"+name);//웹 자동화 작업을 할 접속 사이트 명시
		  }
		  
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  
		  //홈에 있는 img 가져와서 담기

			List<WebElement> searchBox = driver.findElements(By.tagName("img"));
			List<WebElement> searchBox2 = driver.findElements(By.cssSelector("span.title-text"));
			if(searchBox2.size()>20) {
				
				searchBox2.remove(0);
			}
			

			//정제해서 담을 배열 준비
			String[] arr = new String[searchBox.size()];
			String[] arr2 = new String[searchBox2.size()];
			
			for(int i=0;i<searchBox2.size();i++) {
				arr2[i] += searchBox2.get(i).getText();
				arr2[i]=arr2[i].replace("null", "");
			}
			
			for(int i=0;i<searchBox.size();i++) {
				arr[i] += searchBox.get(i).getAttribute("src");
				arr[i]=arr[i].replace("null", "");
				//스크롤을 안거치는 영역이 없도록 내려줘야된다. 안그러면 lazyload 뜸.
				String lzly = "lazyload";
				
				if((i+1)!=20&&searchBox.get(i+1).getAttribute("src").contains(lzly)) {//다음번 출력 값에 lazyload가 포함되어 출력시 스크롤 내리고 쉬기
					
					try {
						js.executeScript("window.scrollTo(0,200)");
						Thread.sleep(1000);
						js.executeScript("window.scrollTo(0,document.body.scrollHeight)");
									
					} catch (InterruptedException e) {
						e.printStackTrace();
				}
				
				}
			}
			//홈 이미지 출력

			Thread.sleep(1000);
			
			ArrayList<PosterRank> ottRank = new ArrayList<PosterRank>();
			for(int i=0;i<arr.length;i++) {
				ottRank.add(new PosterRank(arr2[i],arr[i]));
			}
			driver.quit();
		
		return ottRank;
	}

}
