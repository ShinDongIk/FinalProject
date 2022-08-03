package com.payalot.enjoyforott.crawl;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.logging.LogType;
import org.openqa.selenium.logging.LoggingPreferences;
import org.openqa.selenium.remote.CapabilityType;

import com.payalot.enjoyforott.poster.model.vo.Poster;
import com.payalot.enjoyforott.poster.model.vo.PosterReview;

public class autoCr {
	
	
		public static ArrayList<PosterReview> navercrwal(ArrayList<Poster> list) throws Exception {

	WebDriver driver = null;	
	
	System.setProperty("webdriver.chrome.driver", "C:\\Tools\\chromedriver_win32\\chromedriver.exe");//Web Driver 압축 해제 경로 입력
	
	  ChromeOptions options = new ChromeOptions();
	  options.addArguments(
	   "--verbose",
//	   "--headless", //창 안뜨게 하는구문
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
	  driver.get("https://www.naver.com/");//웹 자동화 작업을 할 접속 사이트 명시
	  
	   
	  
	  
	 
	 
	 
	 ArrayList<PosterReview> pr = new ArrayList<PosterReview>();
	 
	 
	 for(int i=0;i<list.size();i++) {
		 WebElement text = driver.findElement(By.name("query"));//input버튼
		 Thread.sleep(1000);
		 text.sendKeys(list.get(i).getPostName());
		 
		 try {
			 
			 WebElement button = driver.findElement(By.cssSelector("#nx_search_form > fieldset > button > i"));
			 button.click();
		 }catch(org.openqa.selenium.NoSuchElementException e) {
			 WebElement button = driver.findElement(By.cssSelector("#search_btn > span.ico_search_submit"));
			 button.click();
		 }
		 
		 
		 
		 Thread.sleep(1000);
		 try {
			 
			 WebElement avgScore = driver.findElement(By.xpath("//*[@id='main_pack']/div[2]/div[2]/div[1]/div[2]/div[3]/ul/li[2]/a/div[1]/span[1]"));
			 WebElement watchedPeople = driver.findElement(By.xpath("//*[@id='main_pack']/div[2]/div[2]/div[1]/div[2]/div[3]/ul/li[3]/div[1]/span[1]"));
			 
			 Thread.sleep(1000);
			 try {
				 int v = Integer.parseInt(String.valueOf(avgScore.getText().charAt(0)));
				 int vv = Integer.parseInt(watchedPeople.getText().replace(",", ""));
				 pr.add(new PosterReview(list.get(i).getPostNo(),list.get(i).getPostName(),v,vv));
			 }catch(java.lang.NumberFormatException e) {
				 e.printStackTrace();
			 }
		 }catch(org.openqa.selenium.NoSuchElementException e) {
			 try {
				 
				 WebElement avgScore = driver.findElement(By.xpath("//*[@id='main_pack']/div[2]/div[2]/div[1]/div[2]/div[2]/dl/div[3]/dd"));
				 WebElement watchedPeople = driver.findElement(By.xpath("//*[@id=\'main_pack\']/div[2]/div[2]/div[1]/div[2]/div[2]/dl/div[4]/dd"));
				 Thread.sleep(1000);
				 try {
					 int v = Integer.parseInt(String.valueOf(avgScore.getText().charAt(0)));
					 int vv = Integer.parseInt(watchedPeople.getText().replaceAll("[^0-9]", ""));
					 pr.add(new PosterReview(list.get(i).getPostNo(),list.get(i).getPostName(),v,vv));
				 }catch(java.lang.NumberFormatException ex) {
					 ex.printStackTrace();
				 }
			 }catch(org.openqa.selenium.NoSuchElementException ee) {
				 WebElement avgScore = driver.findElement(By.xpath("//*[@id=\'main_pack\']/div[2]/div[2]/div[1]/div[2]/div[3]/div[2]/a/span/span[2]"));
				 WebElement watchedPeople = driver.findElement(By.xpath("//*[@id=\'main_pack\']/div[2]/div[2]/div[1]/div[2]/div[3]/div[2]/a/span/span[2]"));
				 try {
					 int v = Integer.parseInt(String.valueOf(avgScore.getText().charAt(0)));
					 int vv = Integer.parseInt(watchedPeople.getText().replaceAll("[^0-9]", ""));
					 pr.add(new PosterReview(list.get(i).getPostNo(),list.get(i).getPostName(),v,vv));
				 }catch(java.lang.NumberFormatException ex) {
					 ex.printStackTrace();
				 }
			 }
			 
			 
		 }
		 
		 
		 System.out.println(pr);
		 
		 WebElement text2 = driver.findElement(By.name("query"));
		 
		 text2.clear();
	 }
	
	 for(PosterReview pt:pr) {
		 System.out.println(pt);
	 }
	  	
	  	return pr;
	  	
	  
	
		
		}


}
