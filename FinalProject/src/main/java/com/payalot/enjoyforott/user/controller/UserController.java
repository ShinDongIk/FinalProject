package com.payalot.enjoyforott.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.payalot.enjoyforott.user.model.service.UserService;
import com.payalot.enjoyforott.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그인
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/userLoginForm";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(User u,HttpSession session,ModelAndView mv) {

		User loginUser = userService.loginUser(u);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
		
		session.setAttribute("loginUser", loginUser);
		mv.setViewName("redirect:/");
		} else {
		mv.addObject("errorMsg", "로그인 실패");
		mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원가입
	@RequestMapping("joinTosForm.me")
	public String joinTosForm() {
		return "user/userJoinTosForm";
	}
	
	@RequestMapping("joinForm.me")
	public String joinForm() {
		return "user/userEnrollForm";
	}
	
	@RequestMapping("join.me")
	public String joinUser(User u, HttpSession session, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		
		u.setUserPwd(encPwd);

		int result = userService.joinUser(u);
		
		if(result>0) {
			session.setAttribute("loginUser", u); 
			return "redirect:/joinComplete.me";
		} else {
			model.addAttribute("errorMsg","회원가입에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("joinComplete.me")
	public String joinComplete(User u) {
		
		System.out.println(u);
		return "user/userJoinComplete";
	}
	
	@RequestMapping("idCheck.me")
	@ResponseBody
	public String idCheck(String checkId, Model model) {
				
		int count = userService.idCheck(checkId);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("nicknameCheck.me")
	@ResponseBody
	public String nicknameCheck(String checkNickname, Model model) {
		System.out.println(checkNickname);
		int count = userService.nicknameCheck(checkNickname);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	

}
