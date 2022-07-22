package com.payalot.enjoyforott.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.notice.model.service.NoticeServiceImpl;
import com.payalot.enjoyforott.notice.model.vo.Board;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	@RequestMapping("userMypage.us")
	public String userMypage() {
		return "common/userMypage";
	}
	
	
	//공지사항 리스트
		@RequestMapping("userNoticeListView.us")
		public ModelAndView adminNoticeListView(
											@RequestParam(value="cPage",defaultValue = "1") int currentPage,
											ModelAndView mv) {
			int listCount = noticeService.selectNoticeListCount();
			
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.selectNoticeList(pi);

			mv.addObject("list",list);
			mv.addObject("pi",pi).setViewName("notice/userNoticeListView");;
			
			return mv;
		}
		
		//공지사항 상세보기
		@RequestMapping("userNoticeDetailView.us")
		public ModelAndView adminNoticeDetailView(int bno,ModelAndView mv) {
			
			//조회수 증가
			int result=noticeService.increaseCount(bno);
			
			if(result>0) {
				Board b = noticeService.noticeDetailView(bno);
				mv.addObject("b",b).setViewName("notice/userNoticeDetailView");
			}else {
				mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
		
		//공지사항 제목 검색
		@RequestMapping("userSearchNotice.us")
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
				mv.addObject("list",list).setViewName("notice/userSearchNoticeListView");
				
			}else {
				int listCount = noticeService.searchNoticeTitleList(search);
				int pageLimit=10;
				int boardLimit=10;
				
				PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
				
				ArrayList<Board> list = noticeService.searchNoticeTitle(search,pi);
				
				mv.addObject("search",search);
				mv.addObject("scitem",scitem);
				mv.addObject("pi",pi);
				mv.addObject("list",list).setViewName("notice/userSearchNoticeListView");
			}
				
			return mv;
		}
		
		//Faq리스트
		@RequestMapping("userFaqList.us")
		public ModelAndView adminFaqList(
									@RequestParam(value="cPage",defaultValue = "1") int currentPage,
									ModelAndView mv) {
			int listCount = noticeService.selectFaqListCount();
			int pageLimit=10;
			int boardLimit=10;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<Board> list = noticeService.selectFaqList(pi);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi).setViewName("notice/userFaqList");;
			
			return mv;
		}
		
		//faq 상세보기
		@RequestMapping("userFaqDetailView.us")
		public ModelAndView adminFaqDetailView(int bno,ModelAndView mv) {
			//조회수 증가
			int result=noticeService.increaseCount(bno);
			
			if(result>0) {
				Board b = noticeService.noticeDetailView(bno);
				mv.addObject("b",b).setViewName("notice/userFaqDetailView");
			}else {
				mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
		
		//faq 제목 검색
		@RequestMapping("userSearchFaq.us")
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
				mv.addObject("list",list).setViewName("notice/userFaqSearchList");
			}else {
				int listCount = noticeService.searchFaqContentList(search);
				int pageLimit=10;
				int boardLimit=10;
				
				PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
				
				ArrayList<Board> list = noticeService.searchFaqContent(search, pi);
				
				mv.addObject("search",search);
				mv.addObject("scitem",scitem);
				mv.addObject("pi",pi);
				mv.addObject("list",list).setViewName("notice/faqSearchList");
			}
			
				
			return mv;
		}
		
}
