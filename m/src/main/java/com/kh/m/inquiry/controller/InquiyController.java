package com.kh.m.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.m.common.model.vo.PageInfo;
import com.kh.m.common.template.Pagination;
import com.kh.m.inquiry.model.service.InquiryServiceImpl;
import com.kh.m.inquiry.model.vo.Inquiry;

@Controller
public class InquiyController {
	
	@Autowired
	private InquiryServiceImpl inquiryService;
	
	
	@RequestMapping("inquiryAdminList.in")
	public ModelAndView inquiryAdminList(
							@RequestParam(value="cPage",defaultValue = "1") int currentPage,
							ModelAndView mv) {
		int listCount = inquiryService.inquiryAdminListCount();
		int pageLimit=10;
		int boardLimit=10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Inquiry> list = inquiryService.inquiryAdminList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi).setViewName("adminMenu/inquiryList");
		
		return mv;
	}
	
	@RequestMapping("inquiryUserList.in")
	public ModelAndView inquiryUserList(
							@RequestParam(value="cPage",defaultValue = "1") int currentPage,
							String userId,
							ModelAndView mv) {
		int listCount = inquiryService.inquiryUserListCount(userId);
		int pageLimit=10;
		int boardLimit=10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Inquiry> list = inquiryService.inquiryUserList(pi,userId);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi).setViewName("adminMenu/inquiryList");
		
		return mv;
	}
	

	
	@RequestMapping("inquiryDetail.in")
	public ModelAndView inquiryDetail(int ino, ModelAndView mv) {
		
		return mv;
	}

	
	
}
