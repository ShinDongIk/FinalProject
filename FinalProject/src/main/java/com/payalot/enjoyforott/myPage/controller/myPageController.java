package com.payalot.enjoyforott.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.myPage.model.service.myPageService;


@Controller
public class myPageController {
	
	@Autowired
	private myPageService myPageService;
	

	@RequestMapping("mypage.me")
	public String mypageMain() {
		
		return "myPage/myPageMain";
		
	}
	@RequestMapping("mypageLike.me")
	public String mypagelike() {
		
		return "myPage/myPageLikeList";
	}
	
	@RequestMapping("mypagePartyEnroll.me")
	public String mypageParty() {
		
		return "myPage/myPagejoin";
	}

	@RequestMapping("mypageList.me")
	public String mypageWrite() {
		
		return "myPage/myPageList";
	}
	
	@RequestMapping("mypageUpdate.me")
	public String memberUpdate() {
		
		return "myPage/myPageUpdateForm";
	}
	

	
	
	


}
