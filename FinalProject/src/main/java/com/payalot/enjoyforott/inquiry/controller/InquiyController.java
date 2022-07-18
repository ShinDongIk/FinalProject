package com.payalot.enjoyforott.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

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
		mv.addObject("pi",pi).setViewName("adminMenu/inquiryUserList");
		
		return mv;
	}
	
	@RequestMapping("inquiryEnrollForm.in")
	public String inquiryEnrollForm() {
		return "adminMenu/inquiryEnrollForm";
	}

	@RequestMapping("insertInquiry.in")
	public ModelAndView insertInquiry(
								Inquiry iq,
								MultipartFile[] upfile,
								HttpSession session,
								ModelAndView mv) {
		if(!upfile[0].getOriginalFilename().equals("")) {
			String[] changeName = new String[upfile.length];
			String[] originName = new String[upfile.length];
			for(int i=0;i<upfile.length;i++) {
				
				changeName[i] = "resources/uploadFiles/"+saveFile(upfile,session,iq.getInquiryWriter())[i];
				originName[i] = upfile[i].getOriginalFilename();
				
			}
			String oName = Arrays.toString(originName).replace("[", "").replace("]", "");
			String cName = Arrays.toString(changeName).replace("[", "").replace("]", "");
			iq.setOriginName(oName);
			iq.setChangeName(cName);
		}
		
		int result = inquiryService.insertInquiry(iq);
		
		if(result>0) {
			session.setAttribute("alertMsg", "문의 작성 완료");
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
			
			ext = originName.substring(originName.lastIndexOf("."));
			
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
	
	
	
	@RequestMapping("inquiryDetail.in")
	public ModelAndView inquiryDetail(int ino, ModelAndView mv) {
		Inquiry iq = inquiryService.inquiryUserDetailView(ino);
		String[] changeName=iq.getChangeName().split(", ");
		String[] originName=iq.getOriginName().split(", ");
		ArrayList<FileName> imgList = new ArrayList<FileName>();
		for(int i=0;i<changeName.length;i++) {
			imgList.add(new FileName(
									changeName[i],
									originName[i]
									));
		}
		
		mv.addObject("iq",iq);
		mv.addObject("imgList",imgList);
		mv.setViewName("adminMenu/inquiryUserDetail");
		return mv;
	}
	
	@RequestMapping("deleteInquiry.in")
	public ModelAndView deleteInquiry(@RequestParam(value="bno") int[] bno,
										ModelAndView mv,
										HttpSession session) {
		int result = inquiryService.deleteInquiry(bno);
		if(result>0) {
			mv.setViewName("redirect:inquiryUserList.in");
		}else {
			mv.addObject("errorMsg","삭제실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
