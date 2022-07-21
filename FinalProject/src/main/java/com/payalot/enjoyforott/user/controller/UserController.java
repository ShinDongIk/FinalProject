package com.payalot.enjoyforott.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
	
//	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
//	private static final String String = null;
	
	//로그인 폼 이동
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/userLoginForm";
	}
	
	//로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember(User u,HttpSession session,ModelAndView mv) {
		System.out.println("로그인 실행됨");
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
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원가입 약관페이지 폼 이동
	@RequestMapping("joinTosForm.me")
	public String joinTosForm() {
		return "user/userJoinTosForm";
	}
	
	//회원가입 정보입력 폼 이동
	@RequestMapping("joinForm.me")
	public String joinForm() {
		return "user/userEnrollForm";
	}
	
	//회원가입
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
	
	//회원가입 완료페이지 이동
	@RequestMapping("joinComplete.me")
	public String joinComplete(User u) {
		return "user/userJoinComplete";
	}
	
	//아이디 중복여부 확인
	@RequestMapping("idCheck.me")
	@ResponseBody
	public String idCheck(String checkId) {
		
		int count = userService.idCheck(checkId);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	//닉네임 중복여부 확인
	@RequestMapping("nicknameCheck.me")
	@ResponseBody
	public String nicknameCheck(String checkNickname) {

		int count = userService.nicknameCheck(checkNickname);
		return (count>0) ? "NNNNN" : "NNNNY";
	}
	
	//비밀번호 일치 확인
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
	
	//이메일 인증코드 체크
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
	
	//이메일 인증코드 발송
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
	
	//아이디, 비밀번호 찾기
	@RequestMapping("findUserForm.me")
	public String findUserForm() {
		return "user/userFindUserForm";
	}
	
//	@RequestMapping("findId.me")
//	public String findId(String idUserName, String idUserEmail, User u, Model model, HttpSession session) {
//		
//		System.out.println("컨트롤러 호출 됨");
//		System.out.println(u);
//		
//		
//		System.out.println(idUserName);
//		System.out.println(idUserEmail);
//		
//		u.setUserName(idUserName);
//		u.setUserEmail(idUserEmail);
//		
//		System.out.println(u);
//		
//		User u2 = userService.findId(u);
//		System.out.println(u2);
//		
//		if(u2 != null) {
//			model.addAttribute("userInfo", u); 
//			return "redirect:/findedId.me";
//		} else {
//			session.setAttribute("alertMsg","일치하는 정보가 없습니다.");
//			return "user/userFindUserForm";
//		}
//	}
	
	@RequestMapping("findedId.me")
	public String findedId(User u) {
		return "user/userFindedId";
	}

	
	@RequestMapping("findPwd.me")
	public String findPwd(String pwdUserId, String pwdUserEmail, Model model) {
		System.out.println(pwdUserId+pwdUserEmail);
//		System.out.println(pwdUserEmail);
		
		return "user/userFindPwd";
	}
	
	//네이버
	
	@RequestMapping("naverlogincallback.me")
	public String naverLogin() {
		return "user/userNaverLoginAPICallback";		
	}
	
	@RequestMapping("naverenrollcallback.me")
	public String naverEnroll() {
		return "user/userNaverEnrollAPICallback";		
	}
	
	@RequestMapping(value="naverjoin")
	@ResponseBody
	public String naverjoin(User u, HttpSession session, Model model) {
		
		//닉네임 재설정
		String newNickname="";
		if(u.getUserNickname().length()>4) {
			newNickname = "N_"+u.getUserNickname().substring(0,4);
		}else {
			newNickname = "N_"+u.getUserNickname();
		}
		
		u.setUserNickname(newNickname);
		
		//아이디 중복체크
		int idChk = userService.idCheck(u.getUserId());
		
		if(idChk>0) {
			return "joined";
		} else {
			//가입진행
			int result = userService.joinUser(u);
			
			System.out.println(u);

			if(result>0) {
				session.setAttribute("loginUser", u); 
				return "ok";
			} else {
				return "no";
			}
		}		
	}
	
	@RequestMapping(value="naverlogin")
	@ResponseBody
	public String naverlogin(User u, HttpSession session, Model model) {
		
		System.out.println(u);
		User loginUser = userService.loginUser(u);
				
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser); 
			return "ok";
		} else {
			return "no";
		}		
	}
}
