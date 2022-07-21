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
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.payalot.enjoyforott.poster.model.vo.Poster;

public class crRecom {
	
	public static ArrayList<Poster> OttRecom(int j,int num) throws InterruptedException{
		
	

	WebDriver driver = null;	
	
	System.setProperty("webdriver.chrome.driver", "C:\\Tools\\chromedriver_win32\\chromedriver.exe");//Web Driver 압축 해제 경로 입력
	
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
	  driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);//로드 웹페이지에서 특정 요소를 찾을 때까지 기다리는 시간 설정
	  driver.manage().timeouts().pageLoadTimeout(10, TimeUnit.SECONDS);//페이지로드가 완료 될 때까지 기다리는 시간 설정
	  driver.manage().window().maximize();//브라우저 창 최대화
	  driver.get("https://m.kinolights.com/discover/explore");//웹 자동화 작업을 할 접속 사이트 명시
	  
	  JavascriptExecutor js = (JavascriptExecutor) driver;
	  
	  //팝업창 삭제
	  try {
		  
		  WebElement xButton = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/div[2]/button/i"));//x버튼
		  
		  xButton.click();
	  }catch(org.openqa.selenium.NoSuchElementException eq)	{
		  WebElement xButton = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/div[2]/button/i"));//x버튼
		  
		  Thread.sleep(1000);
		  xButton.click();
	  }

	  	
	  //*[@id="contents"]/section/div[3]/div/div/div[3]/button
	  	
	  	WebElement kindBtt = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[3]/div/div/div[3]/button"));//액션 클릭
	  	
	  	//js.executeScript 문을 사용해서 클릭해야된다. (팝업창이 있을 경우)
	  	js.executeScript("arguments[0].click();", kindBtt);
	  	
	  	String Action =null;
	  	if(j==1) {

	  		WebElement ActionBtn = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[1]"));//검색 클릭
	  		WebElement ActionSpan = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[1]/span"));//검색 클릭
		  	Action = ActionSpan.getText();
		  	
		  	js.executeScript("arguments[0].click();", ActionBtn);
	  	}else if(j==2) {
	  		WebElement RomansBtn = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[9]"));//검색 클릭
		  	WebElement RomansSpan = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[9]/span"));//검색 클릭
		  	Action = RomansSpan.getText();
		  	
		  	js.executeScript("arguments[0].click();", RomansBtn);
	  	}
	  	else if(j==3) {
	  		WebElement HorrorBtn = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[12]"));//검색 클릭
		  	WebElement HorrorSpan = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[12]/span"));//검색 클릭
		  	Action = HorrorSpan.getText();
		  	
		  	js.executeScript("arguments[0].click();", HorrorBtn);
	  	}
	  	else if(j==4) {
	  		WebElement ComedyBtn = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[8]"));//검색 클릭
		  	WebElement ComedySpan = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[8]/span"));//검색 클릭
		  	Action = ComedySpan.getText();
		  	
		  	js.executeScript("arguments[0].click();", ComedyBtn);
	  	}
	  	else {
	  		WebElement AnimationBtn = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[11]"));//검색 클릭
		  	WebElement AnimationSpan = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[1]/div[3]/div[3]/div[2]/div/button[11]/span"));//검색 클릭
		  	Action = AnimationSpan.getText();
		  	
		  	js.executeScript("arguments[0].click();", AnimationBtn);
	  	}
	  	
	  	
	  	Thread.sleep(1000);


	  	try {
	  		
	  		WebElement SearchButton = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[2]/button[2]"));//검색 클릭
	  		js.executeScript("arguments[0].click();", SearchButton);
	  	}catch(org.openqa.selenium.NoSuchElementException e) {
	  		
	  		WebElement SearchButton = driver.findElement(By.xpath("//*[@id=\"contents\"]/section/div[4]/div[2]/div[2]/button[2]"));//검색 클릭
	  		Thread.sleep(1000);
	  		js.executeScript("arguments[0].click();", SearchButton);
	  	}

	  	
	  
	  	
	  	
	  	Thread.sleep(1000);
	  	
		
		List<WebElement> Title = driver.findElements(By.className("title"));
		List<WebElement> Img = driver.findElements(By.tagName("img"));
		//정제해서 담을 배열 준비
		String[] Titlearr = new String[Title.size()];
		String[] Imgarr = new String[Img.size()];
		
		for(int i=0;i<Title.size();i++) {
			Titlearr[i] += Title.get(i).getText();
			Titlearr[i]=Titlearr[i].replace("null", "");
		}
		
		for(int i=0;i<Img.size();i++) {
			Imgarr[i] += Img.get(i).getAttribute("src");
			Imgarr[i]=Imgarr[i].replace("null", "");
			//스크롤을 안거치는 영역이 없도록 내려줘야된다. 안그러면 lazyload 뜸.
			String lzly = "lazyload";
			
			if((i+1)!=40&&Img.get(i+1).getAttribute("src").contains(lzly)) {//다음번 출력 값에 lazyload가 포함되어 출력시 스크롤 내리고 쉬기
				
				try {
					js.executeScript("window.scrollBy(0,800)");
					Thread.sleep(1000);

								
				} catch (InterruptedException e) {
					e.printStackTrace();
			}
			
			}
		}

		Thread.sleep(1000);
		
		int cnt =0;
		
		
		ArrayList<String> b = new ArrayList<String>();
//		js.executeScript("window.scrollTo(0,0)");
		js.executeScript("window.scrollBy(0,-800)");
		Thread.sleep(1000);
		js.executeScript("window.scrollBy(0,-800)");
		Thread.sleep(1000);
		js.executeScript("window.scrollBy(0,-800)");
		
		
		String ott1 = null;
		String[] ottkind = new String[num];
		while(cnt!=num) {
			try {
				Img.get(cnt).click();
			}catch(org.openqa.selenium.StaleElementReferenceException e) {
				List<WebElement> Img2 = driver.findElements(By.tagName("img"));
				try {
					
					Img2.get(cnt).click();
				}catch(org.openqa.selenium.ElementClickInterceptedException ex) {
					js.executeScript("window.scrollBy(0,300)");
					new WebDriverWait(driver, 20).until(ExpectedConditions.elementToBeClickable(Img2.get(cnt))).click();
				}
			}
			Thread.sleep(1000);
			js.executeScript("window.scrollBy(0,800)");
			//작품 경로 찾기 ott찾아보기
			try{
				if(driver.findElement(By.cssSelector(".cell.provider-name")).isDisplayed()) {
					List<WebElement> Ott = driver.findElements(By.cssSelector(".cell.provider-name"));
					String[] ott = new String[Ott.size()];
					
					for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
					ott[i]+= Ott.get(i).getText();
					if(ott[i].contains("null")) {
						ott[i]=ott[i].replace("null", "");
					}
				}
					ott1=String.join(",", ott);
					ottkind[cnt]=ott1;
				
				}
					
					
			
				//ott 못찾았을 경우
			}catch(org.openqa.selenium.NoSuchElementException e) {
				
				try {
					
					if(driver.findElement(By.cssSelector(".theater-name")).isDisplayed()) {//ott없으면 시네마 찾기
						
						List<WebElement> Ott2 = driver.findElements(By.cssSelector(".theater-name"));
						
						String[] ott = new String[Ott2.size()];
						for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
							ott[i]+= Ott2.get(i).getText();
							if(ott[i].contains("null")) {
								ott[i]=ott[i].replace("null", "");
							}
						}
						ott1=String.join(",", ott);
						ottkind[cnt]=ott1;
						
					}
				}catch(org.openqa.selenium.NoSuchElementException ex) { //시네마도 없으면 값 넣어주기
					
					String[] ott = {"넷플릭스","왓챠"};
					for(int i=0;i<ott.length;i++) {
					if(ott[i].contains("null")) {
						ott[i]=ott[i].replace("null", "");
					}
				}
					ott1=String.join(",", ott);
					ottkind[cnt]=ott1;
				}
			}
					
//					
//					List<WebElement> Ott2 = driver.findElements(By.cssSelector(".theater-name"));
//					
//					String[] ott = new String[Ott2.size()];
//					for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
//						ott[i]+= Ott2.get(i).getText();
//						if(ott[i].contains("null")) {
//							ott[i]=ott[i].replace("null", "");
//						}
//					}
//					ott1=String.join(",", ott);
//					ottkind[cnt]=ott1;
//				}
//				
//				List<WebElement> Ott2 = driver.findElements(By.cssSelector(".theater-name"));
//				if(Ott2.isEmpty()) {
//					String[] ott = {"넷플릭스","왓챠"};
//					for(int i=0;i<ott.length;i++) {
//					if(ott[i].contains("null")) {
//						ott[i]=ott[i].replace("null", "");
//					}
//				}
//					ott1=String.join(",", ott);
//					ottkind[cnt]=ott1;
//			}else {
//				String[] ott = new String[Ott2.size()];
//				for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
//					ott[i]+= Ott2.get(i).getText();
//					if(ott[i].contains("null")) {
//						ott[i]=ott[i].replace("null", "");
//					}
//				}
//				ott1=String.join(",", ott);
//				ottkind[cnt]=ott1;
//			}
			
//			List<WebElement> Ott = driver.findElements(By.cssSelector(".cell.provider-name"));
//			//작품 담을 그릇 사이즈 만들기
//			
//			
//			if(Ott.isEmpty()) {
//				List<WebElement> Ott2 = driver.findElements(By.cssSelector(".theater-name"));
//				if(Ott2.isEmpty()) {
//					String[] ott = {"넷플릭스","왓챠"};
//					for(int i=0;i<ott.length;i++) {
//					if(ott[i].contains("null")) {
//						ott[i]=ott[i].replace("null", "");
//					}
//				}
//					ott1=String.join(",", ott);
//					ottkind[cnt]=ott1;
//			}else {
//				String[] ott = new String[Ott2.size()];
//				for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
//					ott[i]+= Ott2.get(i).getText();
//					if(ott[i].contains("null")) {
//						ott[i]=ott[i].replace("null", "");
//					}
//				}
//				ott1=String.join(",", ott);
//				ottkind[cnt]=ott1;
//			}
//				
//		
//			}else {
//				String[] ott = new String[Ott.size()];
//				
//				for(int i=0;i<ott.length;i++) {//작품길이 만큼 값저장
//				ott[i]+= Ott.get(i).getText();
//				if(ott[i].contains("null")) {
//					ott[i]=ott[i].replace("null", "");
//				}
//			}
//				ott1=String.join(",", ott);
//				ottkind[cnt]=ott1;
//				}


			
			
			Thread.sleep(1000);
			js.executeScript("window.scrollBy(0,800)");
			
			//작품설명
			WebElement Des = driver.findElement(By.className("synopsis"));
				try {
					if(Des.getText().isEmpty()) {
						b.add("");
					}else {
						
						b.add(Des.getText().replace("null", ""));
					}
					
									
				} catch (org.openqa.selenium.StaleElementReferenceException ee) {
					js.executeScript("window.scrollBy(0,300)");
					Thread.sleep(1000);
			}
			
		
			driver.navigate().back();
			//잠깐 스레드 쉬어주기
			Thread.sleep(1000);
			cnt +=1;
			if(cnt==num) {
				
				break;
			}
		
		}
		
		
	  	ArrayList<Poster> result = new ArrayList<Poster>(); 
	  	for(int i=0;i<num;i++) {
	  		result.add(new Poster(Titlearr[i],b.get(i),Action,ottkind[i],Imgarr[i]));
		}
	  	System.out.println(result);
		driver.quit();
		
		
	
	  return result;
}

}
