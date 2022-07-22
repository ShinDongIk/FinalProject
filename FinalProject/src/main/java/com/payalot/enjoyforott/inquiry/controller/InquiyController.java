package com.payalot.enjoyforott.inquiry.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.service.InquiryServiceImpl;
import com.payalot.enjoyforott.inquiry.model.vo.FileName;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;
import com.payalot.enjoyforott.inquiry.model.vo.Reply;

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
		mv.addObject("pi",pi).setViewName("adminMenu/inquiryAdminList");
		
		return mv;
	}
	
	@RequestMapping("inquiryAdminDetail.in")
	public ModelAndView inquiryDetail(int ino, ModelAndView mv) {
		Inquiry iq = inquiryService.inquiryUserDetailView(ino);
		if(iq.getChangeName()!=null) {
			String[] changeName=iq.getChangeName().split(", ");
			String[] originName=iq.getOriginName().split(", ");
			ArrayList<FileName> imgList = new ArrayList<FileName>();
			for(int i=0;i<changeName.length;i++) {
				imgList.add(new FileName(
						changeName[i],
						originName[i]
						));
			}
			mv.addObject("imgList",imgList);
		}
		mv.addObject("iq",iq);
		mv.setViewName("adminMenu/inquiryAdminDetail");
		return mv;
	}
	
	@RequestMapping("deleteInquiry.in")
	public ModelAndView deleteInquiry(@RequestParam(value="bno") int[] bno,
										ModelAndView mv,
										HttpSession session) {
		inquiryService.deleteReply(bno);
		int result = inquiryService.deleteInquiry(bno);
		if(result>0) {
			mv.setViewName("redirect:inquiryUserList.in");
		}else {
			mv.addObject("errorMsg","삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="insertReply.in",produces="text/html; charset=UTF-8")
	public String insertReply(Reply r) {
		
		Reply sel = inquiryService.replyList(r.getInquiryNo());
		if(sel==null) {
			int result = inquiryService.insertReply(r);
			if(result>0) {
				inquiryService.updateResult(r.getInquiryNo());
				return "작성성공";
			}else {
				return "작성실패";
			}
		}else {
			return "이미 작성되어 있습니다";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="replyList.in",produces="application/json; charset=UTF-8")
	public String replyList(int inquiryNo) {
		Reply r = inquiryService.replyList(inquiryNo);
		return new Gson().toJson(r);
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply.in",produces="text/html; charset=UTF-8")
	public String updateReply(Reply r) {
		int result = inquiryService.updateReply(r);
		if(result>0) {
			return "수정성공";
		}else {
			return "수정실패";
		}
	}
	
	@RequestMapping("deleteReply.in")
	public ModelAndView deleteReply(int[] ino,ModelAndView mv,HttpSession session) {
		int result = inquiryService.deleteReply(ino);
		if(result>0) {
			inquiryService.updateResultDelete(ino);
			session.setAttribute("alertMsg", "답글 삭제 성공");
			mv.setViewName("redirect:inquiryAdminList.in");
		}else {
			mv.addObject("errorMsg","삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("inquiryAdminSearch.in")
	public ModelAndView inquiryAdminSearch(
									@RequestParam(value="cPage",defaultValue = "1") int currentPage,
									String keyword,int items,ModelAndView mv) {
		ArrayList<Inquiry> list = new ArrayList();
		int pageLimit=10;
		int boardLimit=10;
		PageInfo pi = new PageInfo();
		if(items==1) {
			int listCount = inquiryService.inquiryAdminSearchTitleCount(keyword);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = inquiryService.inquiryAdminSearchTitle(keyword, pi);
		}else {
			int listCount = inquiryService.inquiryAdminSearchWriterCount(keyword);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = inquiryService.inquiryAdminSearchWriter(keyword, pi);
		}
		mv.addObject("keyword",keyword);
		mv.addObject("items",items);
		mv.addObject("pi",pi);
		mv.addObject("list",list).setViewName("adminMenu/inquiryAdminSearchList");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
