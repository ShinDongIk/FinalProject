package com.payalot.enjoyforott.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.inquiry.model.service.InquiryServiceImpl;
import com.payalot.enjoyforott.inquiry.model.vo.FileName;
import com.payalot.enjoyforott.inquiry.model.vo.Inquiry;
import com.payalot.enjoyforott.inquiry.model.vo.Type;

@Controller
public class InquiyUserController {
	
	@Autowired
	private InquiryServiceImpl inquiryService;
	
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
		mv.addObject("pi",pi).setViewName("notice/inquiryUserList");
		
		return mv;
	}
	
	@RequestMapping("inquiryEnrollForm.in")
	public String inquiryEnrollForm() {
		return "notice/inquiryEnrollForm";
	}

	@RequestMapping("insertInquiry.in")
	public ModelAndView insertInquiry(
								Inquiry iq,
								MultipartFile[] upfile,
								HttpSession session,
								ModelAndView mv) {
		
		if(upfile!=null) {
			String[] changeName = new String[upfile.length];
			String[] originName = new String[upfile.length];
			for(int i=0;i<upfile.length;i++) {
				if(upfile[i].getSize() > 0) {
					changeName[i] = "resources/uploadFiles/"+saveFile(upfile,session,iq.getInquiryWriter())[i];
					originName[i] = upfile[i].getOriginalFilename();
				}
			}
			String oName = Arrays.toString(originName).replace("[", "").replace("]", "");
			String cName = Arrays.toString(changeName).replace("[", "").replace("]", "");
			iq.setOriginName(oName);
			iq.setChangeName(cName);
		}
		
		int result = inquiryService.insertInquiry(iq);
		
		if(result>0) {
			session.setAttribute("alertMsg","작성 성공");
			mv.addObject("userId", iq.getInquiryWriter());
			mv.setViewName("redirect:/inquiryUserList.in");
		}else {
			mv.addObject("errorMsg","작성 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	public String[] saveFile(MultipartFile[] upfile,HttpSession session,String inquiryWriter) {
		
		String originName = "";
		
		String currentTime = "";
		
		int ranNum = 0;

		String ext="";
		
		String[] changeName= new String[upfile.length];
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		for(int i=0;i<upfile.length;i++) {
			
			originName = upfile[i].getOriginalFilename();
			
			currentTime = new SimpleDateFormat("yyMMdd").format(new Date());
			
			ranNum=(int)(Math.random()*10000);
			if(upfile[i].getSize()>0) {
				ext = originName.substring(originName.lastIndexOf("."));
			}
			
			changeName[i] = currentTime+ranNum+inquiryWriter+ext;
			
			try {
				upfile[i].transferTo(new File(savePath+changeName[i]));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return changeName;
	}
	
	
	
	@RequestMapping("inquiryUserDetail.in")
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
		mv.setViewName("notice/inquiryUserDetail");
		return mv;
	}
	
	@RequestMapping("inquiryUserUpdateForm.in")
	public ModelAndView inquiryUserUpdate(ModelAndView mv,int ino) {
		Inquiry iq = inquiryService.inquiryUserDetailView(ino);
		ArrayList<Type> tList = inquiryService.type();
		
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
		mv.addObject("tList",tList).setViewName("notice/inquiryUserUpdateForm");
		return mv;
	}
	
	@RequestMapping("updateUserInquiry.in")
	public ModelAndView updateUserInquiry(Inquiry iq,
											MultipartFile[] upfile,
											HttpSession session,
											ModelAndView mv) {
		
		if(upfile!=null) {
			if(iq.getOriginName()!=null) {
				new File(session.getServletContext().getRealPath(iq.getChangeName())).delete();
			}
			String[] changeName = new String[upfile.length];
			String[] originName = new String[upfile.length];
			for(int i=0;i<upfile.length;i++) {
				if(upfile[i].getSize()>1) {
					changeName[i] = "resources/uploadFiles/"+saveFile(upfile,session,iq.getInquiryWriter())[i];
					originName[i] = upfile[i].getOriginalFilename();
				}
			}
			String oName = Arrays.toString(originName).replace("[", "").replace("]", "");
			String cName = Arrays.toString(changeName).replace("[", "").replace("]", "");
			iq.setOriginName(oName);
			iq.setChangeName(cName);
		}
		
		int result = inquiryService.updateInquiry(iq);
		if(result>0) {
			session.setAttribute("alertMsg", "수정 성공");
			mv.setViewName("redirect:inquiryUserList.in?userId="+iq.getInquiryWriter());
		}else {
			mv.addObject("errorMsg","수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("inquiryUserSearch.in")
	public ModelAndView inquiryUserSearch(
									@RequestParam(value="cPage",defaultValue = "1") int currentPage,
									String keyword,String userId,int items,ModelAndView mv) {
		ArrayList<Inquiry> list = new ArrayList();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", userId);
		map.put("key", keyword);
		int pageLimit=10;
		int boardLimit=10;
		PageInfo pi = new PageInfo();
		if(items==1) {
			int listCount = inquiryService.inquiryUserSearchTitleCount(map);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = inquiryService.inquiryUserSearchTitle(map, pi);
		}else {
			int listCount = inquiryService.inquiryUserSearchContentCount(map);
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = inquiryService.inquiryUserSearchContent(map, pi);
		}
		mv.addObject("keyword",map.get("key"));
		mv.addObject("items",items);
		mv.addObject("pi",pi);
		mv.addObject("list",list).setViewName("notice/inquiryUserSearchList");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
