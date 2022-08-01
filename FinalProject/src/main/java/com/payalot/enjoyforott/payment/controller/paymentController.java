package com.payalot.enjoyforott.payment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.payalot.enjoyforott.common.model.template.Pagination;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.payment.model.service.paymentService;
import com.payalot.enjoyforott.payment.model.vo.payment;

@Controller
public class paymentController {

	@Autowired
	private paymentService paymentService;
	
	@RequestMapping("list.pm")
	private String paymentList(
			@RequestParam(value="cpage",defaultValue="1") int currentPage,
			Model model, String userId) {
		
		System.out.println("cpage: " +currentPage);
		
		int listCount = paymentService.selectPaymentCount(userId);
		System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<payment> list = paymentService.selectPayment(pi,userId);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "myPage/myPagePay";
	}
}
