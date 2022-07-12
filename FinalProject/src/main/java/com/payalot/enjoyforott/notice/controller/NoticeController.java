package com.payalot.enjoyforott.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payalot.enjoyforott.notice.model.service.NoticeServiceImpl;
import com.payalot.enjoyforott.notice.model.vo.Board;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	@RequestMapping("noticeListView.no")
	public String noticeView() {
		return "notice/noticeListView";
	}
	
	@RequestMapping("noticeDetailView.no")
	public String noticeDetailView() {
		return "notice/noticeDetailView";
	}
	
	@RequestMapping("report.ad")
	public String report() {
		return "notice/report";
	}
	
	@RequestMapping("oneEnrollForm.no")
	public String oneEnrollForm() {
		return "notice/oneEnrollForm";
	}
	

	
	
}
