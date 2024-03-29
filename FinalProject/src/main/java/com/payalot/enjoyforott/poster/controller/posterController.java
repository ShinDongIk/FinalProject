package com.payalot.enjoyforott.poster.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.payalot.enjoyforott.crawl.crRecom;
import com.payalot.enjoyforott.favor.model.service.favorService;
import com.payalot.enjoyforott.poster.model.service.posterService;
import com.payalot.enjoyforott.poster.model.vo.Poster;
import com.payalot.enjoyforott.poster.model.vo.PosterRank;



@Controller
public class posterController{

	
	@Autowired
	private posterService posterservice;
	
	@Autowired
	private favorService favorservice;
	
	@RequestMapping("rank.ps")
	public String EnterRank(@RequestParam(value="name",defaultValue="kino") String name,
			Model model) throws InterruptedException {
		
		System.out.println(name);
		
		ArrayList<PosterRank> pr = posterservice.PostRank(name);
		
		
		model.addAttribute("pr",pr);
		System.out.println(pr);
		
		

		return "poster/RankingPs";
	}
	@ResponseBody
	@RequestMapping(value="ajax.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod1(@RequestParam(value="name",defaultValue="kino") String name,
			HttpSession session,HttpServletResponse response) throws InterruptedException, IOException{
		
		ArrayList<PosterRank> pr = posterservice.PostRank(name);
		
		System.out.println(pr);
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		return new Gson().toJson(pr);
	}
	
	@RequestMapping("recomend.ps")
	public String PosterRecomend() {
		
		return "poster/RecomPs";
	}
	
	
	@RequestMapping("detail.ps")
	public String PosterDetail(int postNo,Model mv) {
		
		Poster pst = posterservice.PostDetail(postNo);
		
		String str = pst.getPostOtt();
		String[] ottkind = str.split(",");
		
		
		
		mv.addAttribute("pst",pst);
		mv.addAttribute("ottkind",ottkind);
		
		
		
		return "poster/DetailPs";
	}
	
	@RequestMapping("list.ps")
	public String PosterList(String list,Model mv) {
		
		ArrayList<Poster> pst = posterservice.PostAction(list);	
		
		mv.addAttribute("pst",pst);
		
		
		return "poster/ListRecomPs";
	}
	@RequestMapping("auto.do")
	public void AutoInput() throws InterruptedException {
		
		//저장하고 싶은 장르별 작품수
		//int num = 39;
		int num = 20;
		
		for(int i=1;i<6;i++) {
			ArrayList<Poster> pp = crRecom.OttRecom(i,num);
			for(Poster p:pp) {
				int result = posterservice.AutoInput(p);
				
				if(result > 0) {
					System.out.println("자동 인설트 성공");
				}else {
					System.out.println("자동 인설트 실패");
				}
			}
			}
				
		}
	@ResponseBody
	@RequestMapping("good.do")
	public int Good(int postNo,String userId,HttpServletResponse response) {
		
	
		HashMap<String,Object> good = new HashMap<String,Object>();
		
		good.put("postNo", postNo);
		good.put("userId", userId);
		
		
		
		System.out.println(good);
		
		response.setContentType("application/json; charset=UTF-8");
		
		 int result = favorservice.favor(good);
		 
		 if(result>0) {
			 
			 System.out.println("success");
			 
		 }else {
			 
			 System.out.println("failed");
			 
		 }
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectUser.do")
	public int SelectUser(String userId,HttpServletResponse response) {
		
		
		
		 int result = favorservice.favor2(userId);
		 
		 response.setContentType("application/json; charset=UTF-8");
		 
		if(result>0) {
			System.out.println(result);
			return result;
		}else {
			System.out.println(result);
			return result;
		}
		
	}
	
	}

