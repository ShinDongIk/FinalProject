package com.payalot.enjoyforott.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final String String = null;
	
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
	
	@RequestMapping("emailCodeCheck.me")
	@ResponseBody
	public String emailCodeCheck(String code, String inputCode) {
		
		String result = "";
		
		if(inputCode.equals(code)) {
			result = "NNNNY";
		}else {
			result = "NNNNN";
		}
		return result;
	}
	
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception{
		
		//인증번호용 난수
		Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        //이메일 발송
        String setFrom = "enjoyforott@gmail.com";
        String toMail = email;
        String title = "[ENJOY FOR OTT] 회원가입 인증 이메일 입니다.";
        String content = 
                "본 메일은 고객님의 본인 여부를 확인하기 위해 자동으로 발송되었습니다." +
                "<br><br>" + 
                "인증 번호는 <b>" + checkNum + "</b>입니다." + 
                "<br>" + 
                "인증번호 입력창에 위 번호를 입력해 주세요.";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);
        
        return num;

	}
	
	//아이디, 비밀번호 찾기
	@RequestMapping("findUserForm.me")
	public String findUserForm() {
		return "user/userFindUserForm";
	}
	
	//임시비밀번호 발급
	@RequestMapping("findPwd.me")
	public String findPwd(String pwdUserId, String pwdUserEmail) {
		System.out.println(pwdUserId+pwdUserEmail);
//		System.out.println(pwdUserEmail);
		
		return "user/userFindPwd";
	}
	
	

}
