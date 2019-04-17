package com.shopping.login;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ex.HomeController;
import com.shopping.signup.SmSignupServiceImpl;

@Controller
public class SmLoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SmLoginServiceImpl loginServiceImpl;
	
	@Autowired
	private SmSignupServiceImpl signupServiceImpl;
	
	@RequestMapping(value="/")
	public String smlogin(Locale locale, Model model, HttpSession session) {
		
		session.invalidate();
		
		return "login/login";
	}
	
	@RequestMapping(value="/login/main.do")
	public String smMain(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		SmUserVO vo = loginServiceImpl.selectUser(userVO);
		
		//vo의 값(로그인 성공) 또는 session의 값(로그인 상태에서 메인페이지 이동)
		if((vo != null && !"".equals(vo)) || (session.getAttribute("id") != null)) {
			
			if(session.getAttribute("id") == null) {
				session.setAttribute("id", vo.getId());
				session.setAttribute("email", vo.getEmail());
				session.setAttribute("usercode", vo.getUsercode());
			}
			
			return "home/home";
		}
		else {
			model.addAttribute("msg", "로그인 정보가 알맞지 않습니다.");
			return "login/login";
		}
	}
	
	@RequestMapping(value="/login/signUp.do")
	public String smSignUp() {
		return "login/signUp";
	}
	
	@RequestMapping(value="/login/signUpAction.do")
	public String sminsertUser(@ModelAttribute("userVO") SmUserVO userVO,
			HttpServletRequest request, 
			HttpServletResponse response,
			Model model,
			@RequestParam("dns") String dns) {
		
		String email = userVO.getEmail() + "@" + dns;
		userVO.setEmail(email);
		
		signupServiceImpl.insertUser(userVO);
		
		return "login/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/login/idCheck.do")
	public String idCheck(@ModelAttribute("userVO") SmUserVO userVO,
			HttpServletRequest request, 
			HttpServletResponse response,
			Model model) {
		
		String idcheck = signupServiceImpl.selectIdCheck(userVO);
		
		if(idcheck != null && !"".equals(idcheck)) {
			return idcheck;
		}
		
		return "";
	}
}
