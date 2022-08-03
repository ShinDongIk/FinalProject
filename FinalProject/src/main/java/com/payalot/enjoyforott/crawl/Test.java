package com.payalot.enjoyforott.crawl;

import java.util.Arrays;

public class Test{
	
 public static void main(String[] args) {     
	 System.out.println(solution(12345));
 }

 
//	  static String solution(long n) {
//		  
//		  String newnum = "";
//		  
//		  String num = Long.toString(n);
//		  for(int i=num.length()-1;i>=0;i--) {
//			  
//			  newnum = newnum+num.charAt(i);
//		  }
//		  
//		  String[] sp = newnum.split("");
//		  
//		  
//		  
//	      return Arrays.toString(sp);
//	    
//	}
 public static String solution(long n) {
     
     String num = Long.toString(n);
     String newnum = "";
     
     for(int i=num.length()-1;i>=0;i--){
         newnum = newnum+num.charAt(i);
         
     }
     String[] sp = newnum.split("");
     String[] rp = new String[sp.length];
     for(int i=0;i<sp.length;i++) {
    	 
    	 rp[i] = sp[i].trim();
     }
     
     
     return Arrays.toString(rp);
 }
 
 }
