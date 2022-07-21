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
		return "user/userJoinComplete";
	}
	
	@RequestMapping("idCheck.me")
	@ResponseBody
	public String idCheck(String checkId) {
		
		int count = userService.idCheck(checkId);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("nicknameCheck.me")
	@ResponseBody
	public String nicknameCheck(String checkNickname) {

		int count = userService.nicknameCheck(checkNickname);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("pwdCheck.me")
	@ResponseBody
	public String pwdCheck(String userPwd, String userPwdChk) {

		String result = "";
		
		if(userPwd.equals(userPwdChk)) {
			result = "NNNNY";
		}else {
			result = "NNNNN";
		}
		return result;
	}
	
	
	//회원정보수정 
	@RequestMapping("update.me")
	public String updateUser(User u,Model model,HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		
		u.setUserPwd(encPwd);
		
		System.out.println(u);
		int result = userService.updateUser(u);
		System.out.println(result);
		
		if(result>0) { //성공
			//성공했으니 디비에 등록된 변경정보를 다시 조회해와서 세션에 담아야한다.
			User updateMem = userService.loginUser(u);
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "정보수정성공");
			return "redirect:mypage.me";
			
		}else { //실패
			model.addAttribute("errorMsg", "회원정보수정실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.me")
	public String deleteUser(String userPwd, HttpSession session, Model model) {
		
		String encPwd = ((User)session.getAttribute("loginUser")).getUserPwd();
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			//탈퇴
			int result = userService.deleteUser(userId);
			
			if(result>0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alert", "탈퇴 되었습니다.");
				return "redirect:/";
			}else {
				//탈퇴실패
				model.addAttribute("errorMsg", "탈퇴 실패");
				return "common/errorPage";
				
			}
			//비밀번호틀렸
		}else {
			session.setAttribute("alertMsg", "잘못된 비밀번호입니다.");
			return "myPage/mypageUpdate.me";
			
		}
		
	}
	
	
	

}

