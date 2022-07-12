package com.payalot.enjoyforott.notice.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.notice.model.service.NoticeServiceImpl;
import com.payalot.enjoyforott.notice.model.vo.Board;

import oracle.sql.CharacterSet;

@Controller
public class adminController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	@RequestMapping("adminMypage.ad")
	public String adminMypage() {
		return "common/adminMypage";
	}
	
	//�������� ����Ʈ
	@RequestMapping("adminNoticeListView.ad")
	public ModelAndView adminNoticeListView(
										@RequestParam(value="cPage",defaultValue = "1") int currentPage,
										ModelAndView mv) {
		int listCount = noticeService.selectNoticeListCount();
		
		int pageLimit=10;
		int boardLimit=10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = noticeService.selectNoticeList(pi);

		mv.addObject("list",list);
		mv.addObject("pi",pi).setViewName("adminMenu/adminNoticeListView");;
		
		return mv;
	}
	
	//�������� �ۼ�
	@RequestMapping("noticeEnrollForm.ad")
	public String noticeEnrollForm() {
		return "adminMenu/adminNoticeEnrollForm";
	}
	
	@RequestMapping("insertNotice.ad")
	public ModelAndView insertNotice(Board b,ModelAndView mv,HttpSession session) {
		int result = noticeService.insertNotice(b);
		if(result>0) {
			session.setAttribute("alertMsg","�ۼ��Ϸ�");
			mv.setViewName("redirect:adminNoticeListView.ad");
		}else {
			mv.addObject("errorMsg","�ۼ�����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//�������� �󼼺���
	@RequestMapping("adminNoticeDetailView.ad")
	public ModelAndView adminNoticeDetailView(int bno,ModelAndView mv) {
		
		//��ȸ�� ����
		int result=noticeService.increaseCount(bno);
		
		if(result>0) {
			Board b = noticeService.noticeDetailView(bno);
			mv.addObject("b",b).setViewName("adminMenu/adminNoticeDetailView");
		}else {
			mv.addObject("errorMsg","�Խñ� ��ȸ ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//�������� ����
	@RequestMapping("updateNotice.ad")
	public ModelAndView updateNotice(Board b,ModelAndView mv,HttpSession session) {
		int result = noticeService.updateNotice(b);
		if(result>0) {
			session.setAttribute("alertMsg", "���� �Ϸ�");
			mv.setViewName("redirect:adminNoticeListView.ad");
		}else {
			mv.addObject("errorMsg","���� ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//�������� ����
	@RequestMapping("deleteNotice.ad")
	public ModelAndView deleteNotice(@RequestParam(value="bno") int[] bno,ModelAndView mv, HttpSession session) {
		int result = noticeService.deleteNotice(bno);
		if(result>0) {
			session.setAttribute("alertMsg", "���� �Ϸ�");
			mv.setViewName("redirect:adminNoticeListView.ad");
		}else {
			mv.addObject("errorMsg","���� ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//�������� ���� �˻�
	@RequestMapping("searchNotice.ad")
	public ModelAndView searchNotice(int scitem,String search,@RequestParam(value="cPage",defaultValue = "1") int cPage,
									ModelAndView mv) {
		if(scitem==1) {
			int listCount = noticeService.searchNoticeTitleList(search);
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.searchNoticeTitle(search,pi);
			
			mv.addObject("search",search);
			mv.addObject("scitem",scitem);
			mv.addObject("pi",pi);
			mv.addObject("list",list).setViewName("adminMenu/adminSearchNoticeListView");
			
		}else {
			int listCount = noticeService.searchNoticeTitleList(search);
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.searchNoticeTitle(search,pi);
			
			mv.addObject("search",search);
			mv.addObject("scitem",scitem);
			mv.addObject("pi",pi);
			mv.addObject("list",list).setViewName("adminMenu/adminSearchNoticeListView");
		}
			
		return mv;
	}
	
	//Faq����Ʈ
	@RequestMapping("faqList.ad")
	public ModelAndView adminFaqList(
								@RequestParam(value="cPage",defaultValue = "1") int currentPage,
								ModelAndView mv) {
		int listCount = noticeService.selectFaqListCount();
		int pageLimit=10;
		int boardLimit=10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = noticeService.selectFaqList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi).setViewName("adminMenu/faqList");;
		
		return mv;
	}
	
	@RequestMapping("faqEnrollForm.ad")
	public String faqEnrollForm() {
		return "adminMenu/faqEnrollForm";
	}
	
	//faq �ۼ�
	@RequestMapping("insertFaq.ad")
	public ModelAndView insertFaq(Board b,ModelAndView mv,HttpSession session) {
		
		int result = noticeService.insertFaq(b);
		if(result>0) {
			session.setAttribute("alertMsg","�ۼ��Ϸ�");
			mv.setViewName("redirect:faqList.ad");
		}else {
			mv.addObject("errorMsg","�ۼ�����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//faq �󼼺���
	@RequestMapping("faqDetailView.ad")
	public ModelAndView adminFaqDetailView(int bno,ModelAndView mv) {
		//��ȸ�� ����
		int result=noticeService.increaseCount(bno);
		
		if(result>0) {
			Board b = noticeService.noticeDetailView(bno);
			mv.addObject("b",b).setViewName("adminMenu/faqDetailView");
		}else {
			mv.addObject("errorMsg","�Խñ� ��ȸ ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//faq ����
	@RequestMapping("updateFaq.ad")
	public ModelAndView updateFaq(Board b,ModelAndView mv,HttpSession session) {
		int result = noticeService.updateNotice(b);
		if(result>0) {
			session.setAttribute("alertMsg", "���� �Ϸ�");
			mv.setViewName("redirect:faqList.ad");
		}else {
			mv.addObject("errorMsg","���� ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("deleteFaq.ad")
	public ModelAndView deleteFaq(@RequestParam(value="bno") int[] bno,ModelAndView mv, HttpSession session) {
		int result = noticeService.deleteNotice(bno);
		if(result>0) {
			session.setAttribute("alertMsg", "���� �Ϸ�");
			mv.setViewName("redirect:faqList.ad");
		}else {
			mv.addObject("errorMsg","���� ����").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//�������� ���� �˻�
	@RequestMapping("searchFaq.ad")
	public ModelAndView searchFaq(int scitem,String search,@RequestParam(value="cPage",defaultValue = "1") int cPage,
								ModelAndView mv) {
		
		if(scitem==1) {
			int listCount = noticeService.searchFaqTitleList(search);
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.searchFaqTitle(search,pi);
			
			mv.addObject("search",search);
			mv.addObject("scitem",scitem);
			mv.addObject("pi",pi);
			mv.addObject("list",list).setViewName("adminMenu/faqSearchList");
		}else {
			int listCount = noticeService.searchFaqContentList(search);
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.searchFaqContent(search, pi);
			
			mv.addObject("search",search);
			mv.addObject("scitem",scitem);
			mv.addObject("pi",pi);
			mv.addObject("list",list).setViewName("adminMenu/faqSearchList");
		}
		
			
		return mv;
	}
	
	@RequestMapping("memberManage.ad")
	public String memberManage() {
		return "adminMenu/memberManage";
	}
	
	@RequestMapping("adminUpdate.ad")
	public String adminUpdate() {
		return "adminMenu/adminUpdate";
	}
	
	

	
	
}
