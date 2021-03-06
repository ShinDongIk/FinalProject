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

import com.payalot.enjoyforott.poster.model.vo.Poster;

public class cr {
	
    public static ArrayList<Poster> Crawling1() throws InterruptedException {
    	
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
		  driver.get("https://m.kinolights.com/ranking/kino");//웹 자동화 작업을 할 접속 사이트 명시
		  
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  
		    
		   
		  //홈에 있는 img 가져와서 담기
		List<WebElement> searchBox = driver.findElements(By.tagName("img"));
		//정제해서 담을 배열 준비
		String[] arr = new String[searchBox.size()];
		
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
		for(int i=0;i<arr.length;i++) {
			
			System.out.println(arr[i]);
			
		}
		Thread.sleep(1000);
		
		//아래로 다 내리고 신작 클릭
		WebElement element = driver.findElement(By.xpath("(//*[@id='mainNavigation']/nav/a[4])"));
		
		Thread.sleep(1000);

		element.click();
		
		Thread.sleep(1000);
		
		//ArrayList에 여러개 리스트로 뽑을 그릇
		ArrayList<Poster> Listpst = new ArrayList<Poster>();
		  
		//작품 한개의 객체 생성
		 Poster pst= new Poster();
		 
		  
		//현재 페이지 이미지 element2에 넣기
		
		List<WebElement> element2 = new ArrayList<WebElement>();
		List<WebElement> pstTitle = new ArrayList<WebElement>();
		
		element2.addAll(driver.findElements(By.tagName("img")));
		pstTitle.addAll(driver.findElements(By.className("title")));
		
		//element2 img 값 최대한 많이 찾을 수 있게 스크롤 내려주기
		for(int i=0;i<4;i++) {
			
			js.executeScript("window.scrollTo(0,200)");
			Thread.sleep(1000);
			element2.addAll(driver.findElements(By.tagName("img")));
			pstTitle.addAll(driver.findElements(By.className("title")));
		}
		
		//자동화를 위한 count 값
		int count = 0;
		while(count!=13) {
			
		try {
			
			if(element2.get(count).getAttribute("src").contains("null")) {
				
				element2.get(count).getAttribute("src").replace("null", "");
				pstTitle.get(count).getText().replace("null", "");
				pst.setPostImg(element2.get(count).getAttribute("src"));
				pst.setPostName(pstTitle.get(count).getText());
			}else {
				
				pst.setPostImg(element2.get(count).getAttribute("src"));
				pst.setPostName(pstTitle.get(count).getText());
			}
			element2.get(count).click();
			System.out.println("0");
		}catch(org.openqa.selenium.StaleElementReferenceException ex) {
			
			 List<WebElement> element3 = driver.findElements(By.tagName("img"));
			 List<WebElement> pstTitle2 = driver.findElements(By.className("title"));
			if(element3.get(count).getAttribute("src").contains("null")) {
				
				element3.get(count).getAttribute("src").replace("null", "");
				
				pst.setPostImg(element3.get(count).getAttribute("src"));
				pst.setPostName(pstTitle2.get(count).getText());
			}else {
				try {
					
					pst.setPostImg(element3.get(count).getAttribute("src"));
					pst.setPostName(pstTitle2.get(count).getText());
				}catch(java.lang.IndexOutOfBoundsException e) {
					js.executeScript("window.scrollTo(0,200)");
					pstTitle.addAll(driver.findElements(By.className("title")));
					pst.setPostImg(element3.get(count).getAttribute("src"));
					pst.setPostName(pstTitle2.get(count).getText());
				}
			}
			try {
				try {
					
					element3.get(count).click();
				}catch(org.openqa.selenium.ElementNotInteractableException e) {
					js.executeScript("window.scrollTo(0,200)");
					Thread.sleep(1000);
					element3.addAll(driver.findElements(By.tagName("img")));
					pstTitle.addAll(driver.findElements(By.className("title")));
					element3.get(count).click();
				}
			}catch(org.openqa.selenium.ElementNotInteractableException e) {
				js.executeScript("window.scrollTo(0,200)");
			}
			System.out.println(count);
		}
		//넣엇으면 첫번째 이미지 클릭 count를 이용하여 자동화 할 예정
		
		
		//*[@id="listArea"]/section/div[3]/div[2]/div/div/div/div[1]/div/div[1]
		//*[@id="listArea"]/section/div[3]/div[2]/div/div/div/div[2]/div/div[1]
		//*[@id="listArea"]/section/div[4]/div[2]/div/div/div/div[1]/div/div[1]
		Thread.sleep(1000);
		
		js.executeScript("window.scrollTo(0,200)");
		Thread.sleep(1000);
		
		
		
		List<WebElement> searchBox2 = driver.findElements(By.cssSelector(".cell.provider-name"));
		
		String[] ottName = new String[searchBox2.size()];
		for(int i=0;i<searchBox2.size();i++) {
			
				try {
					ottName[i] += searchBox2.get(i).getText();
					ottName[i]=ottName[i].replace("null", "");
					
									
				} catch (org.openqa.selenium.StaleElementReferenceException e) {
					js.executeScript("window.scrollTo(0,300)");
					Thread.sleep(1000);
			}
			
		}
		
		Listpst.add(pst);
		//count +1 씩 해줘서 20번 돌리기
		count +=1;
		
		System.out.println(pst);
		System.out.println(Listpst);
		//뒤로가기 버튼
		driver.navigate().back();
		//잠깐 스레드 쉬어주기
		Thread.sleep(1000);
		
		}
		
		
		driver.quit();
		return Listpst;
    }
	public static void main(String[] args) throws InterruptedException {
		Crawling1();
	}
}